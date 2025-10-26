import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class ReadingPlansScreen extends StatefulWidget {
  const ReadingPlansScreen({super.key});

  @override
  State<ReadingPlansScreen> createState() => _ReadingPlansScreenState();
}

class _ReadingPlansScreenState extends State<ReadingPlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planos de Leitura'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Show create plan dialog
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // Featured Plans
          _buildFeaturedPlans(),
          const SizedBox(height: AppConstants.largePadding),
          // My Plans
          _buildMyPlans(),
        ],
      ),
    );
  }

  Widget _buildFeaturedPlans() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Planos Recomendados',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPlanCard(
                title: 'Caminho da Fé',
                description: '7 dias de leitura espiritual',
                duration: '7 dias',
                color: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              _buildPlanCard(
                title: 'Evangelhos em 15 dias',
                description: 'Leia os 4 evangelhos em 15 dias',
                duration: '15 dias',
                color: Colors.green,
                onTap: () {},
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              _buildPlanCard(
                title: 'Sabedoria e Paz',
                description: '30 dias de sabedoria bíblica',
                duration: '30 dias',
                color: Colors.purple,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMyPlans() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Meus Planos',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        // Empty state
        Center(
          child: Column(
            children: [
              Icon(
                Icons.calendar_today,
                size: 64,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                'Nenhum plano ativo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Escolha um plano recomendado para começar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String description,
    required String duration,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.book,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    duration,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'Começar',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    color: color,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



