import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des Activités')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Activité : Regardé la vidéo "Introduction à la chimie".'),
          ),
          ListTile(
            title: Text('Activité : Répondu à un QCM sur les mathématiques.'),
          ),
        ],
      ),
    );
  }
}
