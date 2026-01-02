import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatMessageCard extends StatelessWidget {
  final int index;
  final Message messageItem;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: index % 2 == 0
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        index % 2 == 0
            ? IconButton(onPressed: () {}, icon: Icon(Iconsax.edit))
            : SizedBox(),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: index % 2 == 0
                  ? Radius.circular(16)
                  : Radius.circular(0),
              bottomRight: index % 2 == 0
                  ? Radius.circular(0)
                  : Radius.circular(16),
            ),
          ),
          color: index % 2 == 0
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surfaceBright,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messageItem.msg!),
                  SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '13:09',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(width: 10),

                      index % 2 == 0 ? Icon(Iconsax.tick_circle) : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
