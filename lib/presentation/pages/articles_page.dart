import 'package:flutter/material.dart';
import '../../logic/repositories/articles_repository.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<ArticlesPage> {
  final ArticlesRepository _articlesRepository = ArticlesRepository();
  late Future<List<dynamic>> _articles;
  List<dynamic> _filteredArticles = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _articles = _articlesRepository.fetchArticles();
    _searchController.addListener(_filterArticles);
  }

  void _filterArticles() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredArticles = [];
      });
    } else {
      _articles.then((articles) {
        setState(() {
          _filteredArticles = articles
              .where((article) =>
          article['title'].toLowerCase().contains(query) ||
              article['content'].toLowerCase().contains(query))
              .toList();
        });
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search courses...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Course Cards
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _articles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No courses found.'));
                  }

                  final articlesToShow = _filteredArticles.isEmpty
                      ? snapshot.data!
                      : _filteredArticles;

                  return ListView.builder(
                    itemCount: articlesToShow.length,
                    itemBuilder: (context, index) {
                      final article = articlesToShow[index];
                      return _buildCourseCard(
                        title: article['title'],
                        description: article['content'],
                        onTap: () {
                          // Navigate to course details or handle tap
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
