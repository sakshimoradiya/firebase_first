import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("h"),
            ),
          ],
        ),
      ),
    );
  }
}
