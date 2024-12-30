import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tchat')),
      body: Center(
        child: const Text('Tchat avec un enseignant à venir.'),
      ),
    );
  }
}
