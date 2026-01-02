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
    // userId = receiverId
    String userId = item.members!
        .where((element) => element != FirebaseAuth.instance.currentUser!.uid)
        .first;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots(),

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ChatUser userInfo = ChatUser.fromJson(snapshot.data!.data()!);

          return Card(
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(roomId: item.id!, userInfo: userInfo),
                ),
              ),
              leading: CircleAvatar(),
              title: Text(userInfo.name!),
              subtitle: Text(item.lastMessage.toString()),

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
