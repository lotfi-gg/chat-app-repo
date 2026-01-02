import 'package:chat_app/firebase/fire_database.dart';
import 'package:chat_app/models/message_model.dart';

import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/chat/widgets/chat_message_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;
  final ChatUser userInfo;
  const ChatScreen({super.key, required this.roomId, required this.userInfo});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userInfo.name!),
            Text(
              widget.userInfo.lastActivated!,

              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.trash)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.copy)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('rooms')
                    .doc(widget.roomId)
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Message> messageItems = snapshot.data!.docs
                        .map((e) => Message.fromJson(e.data()))
                        .toList();
                    return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ChatMessageCard(
                          messageItem: messageItems[index],
                          index: index,
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
              // child: Center(
              //   child: GestureDetector(
              //     child: Card(
              //       child: Padding(
              //         padding: EdgeInsets.all(12),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               '👻',
              //               style: Theme.of(context).textTheme.displayMedium,
              //             ),
              //             SizedBox(height: 16),
              //             Text(
              //               'say asalamu alaykom',
              //               style: Theme.of(context).textTheme.bodyMedium,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
                      controller: msgcon,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.emoji_happy),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.camera),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                        hintText: 'message',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton.filled(
                  onPressed: () {
                    if (msgcon.text.isNotEmpty) {
                      FireData()
                          .sendMessage(
                            widget.userInfo.id!, // uid or toId
                            msgcon.text, // msg
                            widget.roomId, // roomId
                          )
                          .then((value) {
                            setState(() {
                              msgcon.text = '';
                            });
                          });
                    }
                  },
                  icon: Icon(Iconsax.send_1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
