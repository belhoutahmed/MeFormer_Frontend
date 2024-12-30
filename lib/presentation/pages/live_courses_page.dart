import 'package:flutter/material.dart';

class LiveCoursesPage extends StatelessWidget {
  const LiveCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cours en Temps Réel')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cours de Chimie - 15h00'),
            onTap: () {
              // Naviguer vers le cours en temps réel
            },
          ),
          ListTile(
            title: const Text('Cours de Biologie - 17h00'),
            onTap: () {
              // Naviguer vers le cours en temps réel
            },
          ),
        ],
      ),
    );
  }
}
