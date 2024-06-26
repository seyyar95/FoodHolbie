import 'package:auto_route/auto_route.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: 'User');
  ChatUser geminiUser = ChatUser(id: '1', firstName: 'Gemini');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TasteTalker',
          style: ConstantTextTheme.displayLarge!.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: DashChat(
          currentUser: currentUser,
          onSend: (message) {
            setState(() {
              messages = [message, ...messages];
            });
            try {
              String question = message.text;
              gemini.streamGenerateContent(question).listen(
                (event) {
                  ChatMessage? lastMessage = messages.firstOrNull;
                  if (lastMessage != null && lastMessage.user == geminiUser) {
                    lastMessage = messages.removeAt(0);
                    String response = event.content?.parts?.fold(
                          '',
                          (previousValue, element) =>
                              "$previousValue${element.text}",
                        ) ??
                        '';
                    lastMessage.text += response;
                    setState(() {
                      messages = [lastMessage!, ...messages];
                    });
                  } else {
                    String response = event.content?.parts?.fold(
                          '',
                          (previousValue, element) => "$previousValue",
                        ) ??
                        '';
                    ChatMessage chat = ChatMessage(
                      user: geminiUser,
                      createdAt: DateTime.now(),
                      text: response,
                    );
                    setState(() {
                      messages = [chat, ...messages];
                    });
                  }
                },
              );
            } catch (e) {}
          },
          messages: messages,
        ),
      ),
    );
  }
}
