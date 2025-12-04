import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';
import '../../bloc/tts_bloc/tts_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../core/di/injection.dart';
import '../../data/repositories/settings_repository.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeBloc>().add(const LoadTheme());
    context.read<TtsBloc>().add(const InitializeTts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // Theme Section
          /*
          _buildSection(
            title: 'Aparência',
            icon: Icons.palette,
            children: [
              _buildThemeSelector(),
              const SizedBox(height: AppConstants.defaultPadding),
              _buildFontSizeSelector(),
              const SizedBox(height: AppConstants.defaultPadding),
              _buildFontFamilySelector(),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          // TTS Section
          _buildSection(
            title: 'Leitura em Voz Alta',
            icon: Icons.volume_up,
            children: [
              _buildTtsControls(),
              const SizedBox(height: AppConstants.defaultPadding),
              _buildSpeechRateSelector(),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          // Reading Section
          _buildSection(
            title: 'Leitura',
            icon: Icons.menu_book,
            children: [
              _buildReadingSettings(),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          // Notifications Section
          _buildSection(
            title: 'Notificações',
            icon: Icons.notifications,
            children: [
              _buildNotificationSettings(),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          */
          // Premium Section
          _buildSection(
            title: 'Premium',
            icon: Icons.star,
            children: [
              _buildPremiumOption(),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          // About Section
          _buildSection(
            title: 'Sobre',
            icon: Icons.info,
            children: [
              _buildAboutInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSelector() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        String currentTheme = 'system';
        if (state is ThemeLoaded) {
          currentTheme = state.themeMode;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'system',
                  label: Text('Sistema'),
                  icon: Icon(Icons.brightness_auto),
                ),
                ButtonSegment(
                  value: 'light',
                  label: Text('Claro'),
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment(
                  value: 'dark',
                  label: Text('Escuro'),
                  icon: Icon(Icons.dark_mode),
                ),
              ],
              selected: {currentTheme},
              onSelectionChanged: (Set<String> selection) {
                context.read<ThemeBloc>().add(ChangeTheme(selection.first));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildFontSizeSelector() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        double currentSize = 16.0;
        if (state is ThemeLoaded) {
          currentSize = state.fontSize;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tamanho da Fonte',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Slider(
              value: currentSize,
              min: 12.0,
              max: 24.0,
              divisions: 12,
              label: '${currentSize.round()}px',
              onChanged: (value) {
                context.read<ThemeBloc>().add(ChangeFontSize(value));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildFontFamilySelector() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        String currentFamily = AppConstants.primaryFont;
        if (state is ThemeLoaded) {
          currentFamily = state.fontFamily;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fonte',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: currentFamily,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Merriweather',
                  child: Text('Merriweather'),
                ),
                DropdownMenuItem(
                  value: 'NotoSerif',
                  child: Text('Noto Serif'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  context.read<ThemeBloc>().add(ChangeFontFamily(value));
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTtsControls() {
    return BlocBuilder<TtsBloc, TtsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Controles de Voz',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<TtsBloc>().add(const StartSpeaking('Teste de voz'));
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TtsBloc>().add(const PauseSpeaking());
                  },
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TtsBloc>().add(const StopSpeaking());
                  },
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildSpeechRateSelector() {
    return BlocBuilder<TtsBloc, TtsState>(
      builder: (context, state) {
        double currentRate = AppConstants.defaultSpeechRate;
        if (state is TtsInitialized) {
          currentRate = state.speechRate;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Velocidade da Fala',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Slider(
              value: currentRate,
              min: AppConstants.minSpeechRate,
              max: AppConstants.maxSpeechRate,
              divisions: 9,
              label: '${(currentRate * 100).round()}%',
              onChanged: (value) {
                context.read<TtsBloc>().add(ChangeSpeechRate(value));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildReadingSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Modo de Leitura Contínua'),
          subtitle: const Text('Avançar automaticamente para o próximo capítulo'),
          value: false,
          onChanged: (value) {
            // Handle reading mode change
          },
        ),
        SwitchListTile(
          title: const Text('Mostrar Números dos Versículos'),
          subtitle: const Text('Exibir números dos versículos na leitura'),
          value: true,
          onChanged: (value) {
            // Handle verse numbers toggle
          },
        ),
      ],
    );
  }

  Widget _buildNotificationSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Lembretes de Leitura'),
          subtitle: const Text('Receber notificações para leitura diária'),
          value: true,
          onChanged: (value) {
            // Handle notification toggle
          },
        ),
        ListTile(
          title: const Text('Horário do Lembrete'),
          subtitle: const Text('08:00'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Show time picker
          },
        ),
      ],
    );
  }

  Widget _buildPremiumOption() {
    final settingsRepo = getIt<SettingsRepository>();
    return FutureBuilder<bool>(
      future: settingsRepo.isPremium(),
      builder: (context, snapshot) {
        final isPremium = snapshot.data ?? false;
        
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(
              isPremium ? Icons.star : Icons.star_border,
              color: Colors.white,
              size: 32,
            ),
            title: Text(
              isPremium ? 'Versão Premium Ativa' : 'Remover Anúncios',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              isPremium
                  ? 'Você está aproveitando todos os benefícios premium'
                  : 'Desbloqueie a versão premium por R\$ ${AppConstants.premiumPrice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
            trailing: isPremium
                ? const Icon(Icons.check_circle, color: Colors.white)
                : const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
            onTap: isPremium
                ? null
                : () {
                    // TODO: Implement in-app purchase flow
                    // For now, show a dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Versão Premium'),
                        content: Text(
                          'A versão premium remove todos os anúncios e oferece recursos adicionais.\n\n'
                          'Preço: R\$ ${AppConstants.premiumPrice.toStringAsFixed(2)}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement actual purchase flow
                              // For now, just show a message
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Funcionalidade de compra será implementada em breve'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: const Text('Comprar'),
                          ),
                        ],
                      ),
                    );
                  },
          ),
        );
      },
    );
  }

  Widget _buildAboutInfo() {
    return Column(
      children: [
        ListTile(
          title: const Text('Versão do App'),
          subtitle: Text(AppConstants.appVersion),
        ),
        /*
        ListTile(
          title: const Text('Política de Privacidade'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Open privacy policy
          },
        ),
        ListTile(
          title: const Text('Termos de Uso'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Open terms of use
          },
        ),
        ListTile(
          title: const Text('Avaliar App'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Open app store rating
          },
        ),
        */
      ],
    );
  }
}



