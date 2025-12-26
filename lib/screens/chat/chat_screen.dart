import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;
  final ChatUser chatUser;
  const ChatScreen({super.key, required this.roomId, required this.chatUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatUser.name!),
            Text(
              widget.chatUser.lastActivated!,
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
              // child: ListView.builder(
              //   reverse: true,
              //   itemCount: 6,
              //   itemBuilder: (context, index) {
              //     return CharMessageCard(index: index,);
              //   },
              // ),
              child: Center(
                child: GestureDetector(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '👻',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'say asalamu alaykom',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
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
                IconButton.filled(onPressed: () {}, icon: Icon(Iconsax.send)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
