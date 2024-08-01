import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/model/open_ai_model.dart';
import 'package:http/http.dart' as http;

class ChatGPTView extends StatefulWidget {
  const ChatGPTView({super.key});

  @override
  State<ChatGPTView> createState() => _ChatGPTViewState();
}

class _ChatGPTViewState extends State<ChatGPTView>
    with TickerProviderStateMixin {
  TextEditingController messageController = TextEditingController();
  final List<Message> _historyList = List.empty(growable: true);

  String apiKey = '';
  String streamText = '';

  static const String _kStrings = 'Flutter ChatGPT';
  String get _currentString => _kStrings;

  ScrollController scrollController = ScrollController();
  late Animation<int> _characterCount;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    setUpAnimation();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void setUpAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _characterCount =
        StepTween(begin: 0, end: _currentString.length).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          animationController.reverse();
        });
      } else {
        if (status == AnimationStatus.dismissed) {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            animationController.forward();
          });
        }
      }
    });

    animationController.forward();
  }

  Future requestChat(String text) async {
    ChatCompletionModel openAiModel = ChatCompletionModel(
      model: 'gpt-3.5-turbo',
      messages: [
        const Message(role: 'system', content: 'You are a helpful assistant.'),
        ..._historyList,
      ],
      stream: false,
    );

    final url = Uri.https('api.openai.com', '/v1/chat/completions');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(openAiModel.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      String role = jsonData['choices'][0]['message']['role'];
      String content = jsonData['choices'][0]['message']['content'];
      _historyList.last = _historyList.last.copyWith(
        role: role,
        content: content,
      );
      setState(() {
        _scrollDown();
      });
    }
  }

  void clearChat() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('새로운 대화의 시작'),
          content: const Text('신규 대화를 생성하시겠어요?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  messageController.clear();
                  _historyList.clear();
                });
              },
              child: const Text('네'),
            ),
          ],
        );
      },
    );
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
                            title: Text('히스토리'),
                          ),
                        ),
                        const PopupMenuItem(
                          child: ListTile(
                            title: Text('설정'),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () => clearChat(),
                          child: const ListTile(
                            title: Text('새로운 채팅'),
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: _historyList.isEmpty
                      ? Center(
                          child: AnimatedBuilder(
                              animation: _characterCount,
                              builder: (context, child) {
                                String text = _currentString.substring(
                                    0, _characterCount.value);
                                return Row(
                                  children: [
                                    Text(
                                      '${text}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.orange[200],
                                    ),
                                  ],
                                );
                              }),
                        )
                      : GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: ListView.builder(
                            itemCount: _historyList.length,
                            itemBuilder: (context, index) {
                              if (_historyList[index].role == 'user') {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('User'),
                                            Text(_historyList[index].content ??
                                                ''),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.teal,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('ChatGPT'),
                                        Text(_historyList[index].content ?? ''),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
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
                  children: [Text('New Chat')],
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    if (_historyList.isNotEmpty) return;
                    clearChat();
                  }
                  return null;
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(),
                        ),
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Message',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (messageController.text.isEmpty) return;
                        setState(() {
                          _historyList.add(Message(
                              role: 'user',
                              content: messageController.text.trim()));
                          _historyList.add(
                              const Message(role: 'assistant', content: ''));
                        });
                        try {
                          await requestChat(messageController.text.trim());
                          messageController.clear();
                          streamText = '';
                        } catch (e) {
                          print('Error: ${e.toString()}');
                        }
                      },
                      iconSize: 30,
                      icon: const Icon(Icons.send),
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
