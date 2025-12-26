import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final ChatRoom item;
  const ChatCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final othermember = item.members!
        .where((element) => element != FirebaseAuth.instance.currentUser!.uid)
        .toList();
    if (othermember.isEmpty) return const SizedBox();
    final userId = othermember.first;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          ChatUser chatUser = ChatUser.fromJson(asyncSnapshot.data!.data()!);
          return Card(
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(roomId: item.id!, chatUser: chatUser),
                ),
              ),
              leading: CircleAvatar(),
              title: Text(chatUser.name!),
              subtitle: Text(
                item.lastMessage! == '' ? chatUser.about! : item.lastMessage!,
              ),
              trailing: Badge(padding: EdgeInsets.all(5), label: Text('2')),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
