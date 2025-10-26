import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class DailyReflectionScreen extends StatefulWidget {
  const DailyReflectionScreen({super.key});

  @override
  State<DailyReflectionScreen> createState() => _DailyReflectionScreenState();
}

class _DailyReflectionScreenState extends State<DailyReflectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflexão do Dia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh reflection
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share reflection
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Header
            _buildDateHeader(),
            const SizedBox(height: AppConstants.largePadding),
            // Reflection Card
            _buildReflectionCard(),
            const SizedBox(height: AppConstants.largePadding),
            // Previous Reflections
            _buildPreviousReflections(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader() {
    final now = DateTime.now();
    final weekdays = [
      'Domingo',
      'Segunda-feira',
      'Terça-feira',
      'Quarta-feira',
      'Quinta-feira',
      'Sexta-feira',
      'Sábado'
    ];
    final months = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];

    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weekdays[now.weekday % 7],
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${now.day} de ${months[now.month - 1]} de ${now.year}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Verse
            Container(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salmos 23:1',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    '"O Senhor é o meu pastor; nada me faltará."',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            // Reflection
            Text(
              'Reflexão do Dia',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              'Neste versículo, o salmista expressa uma confiança profunda em Deus como seu pastor. A imagem do pastor é uma das mais reconfortantes na Bíblia, representando cuidado, proteção e provisão. Quando dizemos "O Senhor é o meu pastor", estamos declarando nossa dependência total de Deus e nossa confiança em seu cuidado amoroso.\n\n'
              'A frase "nada me faltará" não significa que teremos tudo o que queremos, mas sim que Deus suprirá todas as nossas necessidades reais. Ele conhece o que realmente precisamos e quando precisamos. Como um pastor cuida de suas ovelhas, Deus cuida de nós com amor incondicional e sabedoria perfeita.\n\n'
              'Hoje, lembre-se de que você não está sozinho. O Senhor é seu pastor e está sempre ao seu lado, guiando, protegendo e suprindo suas necessidades.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            // Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add to favorites
                    },
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('Favoritar'),
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Share
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Compartilhar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviousReflections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reflexões Anteriores',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        // Empty state for now
        Center(
          child: Column(
            children: [
              Icon(
                Icons.history,
                size: 48,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                'Nenhuma reflexão anterior',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



