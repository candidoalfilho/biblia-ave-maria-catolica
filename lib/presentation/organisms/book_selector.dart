import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bible_bloc/bible_bloc.dart';
import '../../domain/entities/bible_entity.dart';
import '../../core/constants/app_constants.dart';

class BookSelector extends StatefulWidget {
  const BookSelector({super.key});

  @override
  State<BookSelector> createState() => _BookSelectorState();
}

class _BookSelectorState extends State<BookSelector> {
  @override
  void initState() {
    super.initState();
    context.read<BibleBloc>().add(const LoadBible());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selecionar Livro',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          // Content
          Expanded(
            child: BlocBuilder<BibleBloc, BibleState>(
              builder: (context, state) {
                if (state is BibleLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BibleError) {
                  return Center(
                    child: Text('Erro: ${state.message}'),
                  );
                } else if (state is BibleLoaded) {
                  return _buildBookList(state.bible);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookList(BibleEntity bible) {
    return ListView(
      children: [
        // Old Testament
        _buildTestamentSection(
          'Antigo Testamento',
          bible.oldTestament,
          Icons.menu_book,
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        // New Testament
        _buildTestamentSection(
          'Novo Testamento',
          bible.newTestament,
          Icons.book,
        ),
      ],
    );
  }

  Widget _buildTestamentSection(
    String title,
    List<TestamentEntity> testaments,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppConstants.smallPadding),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ...testaments.map((testament) => _buildBookItem(testament)),
      ],
    );
  }

  Widget _buildBookItem(TestamentEntity testament) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Text(
          testament.name.substring(0, 1),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(testament.name),
      subtitle: Text('${testament.chapters.length} capítulos'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context);
        // Navigate to book chapters
        _showChapterSelector(testament);
      },
    );
  }

  void _showChapterSelector(TestamentEntity testament) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ChapterSelector(
        testament: testament,
        onChapterSelected: (chapter) {
          Navigator.pop(context);
          // Navigate to specific chapter
          // This would be handled by the parent widget
        },
      ),
    );
  }
}

class ChapterSelector extends StatelessWidget {
  final TestamentEntity testament;
  final Function(int) onChapterSelected;

  const ChapterSelector({
    super.key,
    required this.testament,
    required this.onChapterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                testament.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          // Chapters Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: testament.chapters.length,
              itemBuilder: (context, index) {
                final chapter = testament.chapters[index];
                return InkWell(
                  onTap: () => onChapterSelected(chapter.chapterNumber),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${chapter.chapterNumber}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



