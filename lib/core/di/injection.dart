import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/repositories/favorites_repository.dart';
import '../../data/repositories/reading_plans_repository.dart';
import '../../data/repositories/reflections_repository.dart';
import '../../data/repositories/settings_repository.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Initialize Hive
  await Hive.initFlutter();
  
  // Initialize other dependencies
  getIt.init();
}
