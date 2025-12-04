import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import '../../core/constants/app_constants.dart';
import 'settings_repository.dart';

@singleton
class PurchaseRepository {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final SettingsRepository _settingsRepository;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  bool _isAvailable = false;
  List<ProductDetails> _products = [];
  
  // Expose InAppPurchase instance for availability checks
  InAppPurchase get inAppPurchase => _inAppPurchase;

  PurchaseRepository(this._settingsRepository) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _isAvailable = await _inAppPurchase.isAvailable();
      print('InAppPurchase is available: $_isAvailable');
      
      if (!_isAvailable) {
        print('InAppPurchase is not available. This might be because:');
        print('1. Running on emulator (Android emulators don\'t support Google Play Billing)');
        print('2. Google Play Services not available');
        print('3. App not properly signed');
        print('4. Testing on device without Google Play Store');
        return;
      }
      
      await _loadProducts();
      _subscription = _inAppPurchase.purchaseStream.listen(
        _onPurchaseUpdate,
        onDone: () => _subscription?.cancel(),
        onError: (error) => print('Purchase stream error: $error'),
      );
    } catch (e) {
      print('Error initializing InAppPurchase: $e');
      _isAvailable = false;
    }
  }

  Future<void> _loadProducts() async {
    final Set<String> productIds = {AppConstants.premiumProductId};
    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(productIds);

    print('Products found: ${response.productDetails}');
    
    if (response.notFoundIDs.isNotEmpty) {
      print('Products not found: ${response.notFoundIDs}');
    }
    
    _products = response.productDetails;
  }

  Future<List<ProductDetails>> getProducts() async {
    // Try to check availability again in case it changed
    if (!_isAvailable) {
      try {
        _isAvailable = await _inAppPurchase.isAvailable();
        print('Re-checked InAppPurchase availability: $_isAvailable');
      } catch (e) {
        print('Error checking InAppPurchase availability: $e');
        return [];
      }
    }
    
    if (!_isAvailable) {
      print('Cannot get products: InAppPurchase is not available');
      return [];
    }
    
    if (_products.isEmpty) {
      await _loadProducts();
    }
    
    return _products;
  }

  Future<bool> buyProduct(ProductDetails productDetails) async {
    if (!_isAvailable) {
      return false;
    }

    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: productDetails,
    );

    return await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Show pending UI
        print('Purchase pending: ${purchaseDetails.productID}');
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          print('Purchase error: ${purchaseDetails.error}');
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                   purchaseDetails.status == PurchaseStatus.restored) {
          // Verify purchase and grant premium
          _verifyPurchase(purchaseDetails);
        }
        
        if (purchaseDetails.pendingCompletePurchase) {
          _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.productID == AppConstants.premiumProductId) {
      // Grant premium access
      await _settingsRepository.setPremium(true);
      print('Premium access granted!');
    }
  }

  Future<void> restorePurchases() async {
    if (!_isAvailable) {
      return;
    }

    await _inAppPurchase.restorePurchases();
  }

  Future<bool> isPremium() async {
    return await _settingsRepository.isPremium();
  }

  void dispose() {
    _subscription?.cancel();
  }
}

