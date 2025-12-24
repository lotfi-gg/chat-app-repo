import 'package:chat_app/firebase/fire_database.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/screens/chat/widgets/chat_card.dart';
import 'package:chat_app/utils/color.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  TextEditingController emailcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text('enter friend email'),
                        Spacer(),
                        IconButton.filled(
                          onPressed: () {},
                          icon: Icon(Iconsax.scan),
                        ),
                      ],
                    ),

                    CustomField(
                      icon: Iconsax.user,
                      label: 'eamail',
                      controller: emailcon,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: myPrimaryColor,
                      ),
                      onPressed: () {
                        if (emailcon.text.isNotEmpty) {
                          FireData().createRoom(emailcon.text).then((value) {
                            setState(() {
                              emailcon.text = '';
                            });
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: Center(child: Text('search')),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Iconsax.message_add),
      ),
      appBar: AppBar(title: Text('chats')),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('rooms')
                    .where(
                      'members',
                      arrayContains: FirebaseAuth.instance.currentUser!.uid,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatRoom> items =
                        snapshot.data!.docs
                            .map((e) => ChatRoom.fromJson(e.data()))
                            .toList()
                          ..sort(
                            (a, b) => a.lastMessageTime!.compareTo(
                              b.lastMessageTime!,
                            ),
                          );
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ChatCard(item: items[index]);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
