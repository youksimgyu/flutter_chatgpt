import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/views/chat_gpt_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatGPTView(),
    );
  }
}
