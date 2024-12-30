import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommandations')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Recommandation 1 : Réviser les intégrales.'),
          ),
          ListTile(
            title: Text('Recommandation 2 : Regarder la vidéo sur les molécules.'),
          ),
        ],
      ),
    );
  }
}
