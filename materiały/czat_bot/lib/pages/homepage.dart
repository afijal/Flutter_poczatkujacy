import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zadanie/model/chat_bot.dart';
import 'package:zadanie/model/conversation.dart';
import 'package:zadanie/model/message.dart';
import 'package:zadanie/pages/chat_page.dart';
import 'package:zadanie/provider/data.dart';
import 'package:zadanie/widgets/conversation_tile.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    final data = context.read<Data>();
    final odwrotny = ChatBot(
      name: 'Odwrotny',
      getAnswer: (input) => input.split('').reversed.join(''),
    );
    final nic = ChatBot(
      name: 'Nic',
      getAnswer: (input) => input,
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (data.conversations.isEmpty && data.bots.isEmpty) {
        data.addChatBotAndStartConverstaion(odwrotny);
        data.addChatBotAndStartConverstaion(nic);
      } else {
        data.loadChatBots([odwrotny, nic]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chats = context.watch<Data>().conversations;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Czat boty'),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return ConversationTile(
                    content: chats[index].messages.isEmpty ? '' : chats[index].messages.last.text,
                    timestamp: chats[index].messages.isEmpty
                        ? ''
                        : DateFormat.Hm().format(chats[index].messages.last.timestamp),
                    title: chats[index].chatBotName,
                    onTap: () => _navigateToChat(chats[index], index));
              },
              separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                  ),
              itemCount: chats.length)),
    );
  }

  void _navigateToChat(Conversation chat, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          id: chat.id,
        ),
      ),
    );
  }
}
