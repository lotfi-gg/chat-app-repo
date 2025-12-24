import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final ChatRoom item;
  const ChatCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(roomId: item.id!,)),
        ),
        leading: CircleAvatar(),
        title: Text('name'),
        subtitle: Text(item.lastMessage.toString()),
        trailing: Badge(padding: EdgeInsets.all(5), label: Text('2')),
      ),
    );
  }
}
