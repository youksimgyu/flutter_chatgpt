import 'package:flutter/material.dart';

class ChatGPTView extends StatefulWidget {
  const ChatGPTView({super.key});

  @override
  State<ChatGPTView> createState() => _ChatGPTViewState();
}

class _ChatGPTViewState extends State<ChatGPTView> {
  TextEditingController messageController = TextEditingController();

  static const String _kStrings = 'Flutter ChatGPT';
  String get _currentString => _kStrings;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Card(
                  child: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          child: ListTile(
                            title: Text('history'),
                          ),
                        ),
                        const PopupMenuItem(
                          child: ListTile(
                            title: Text('settings'),
                          ),
                        ),
                        const PopupMenuItem(
                          child: ListTile(
                            title: Text('new chat'),
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(_kStrings),
                  ),
                ),
              ),
              Dismissible(
                key: const Key('chat-bar'),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    // logic
                  }
                },
                background: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('New Chat')
                  ],
                ),
                confirmDismiss: (direction) async {
                  if(direction == DismissDirection.startToEnd) {
                    // logic
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ),
                        ),
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message...',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      iconSize: 42,
                      icon: const Icon(Icons.arrow_circle_up),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
