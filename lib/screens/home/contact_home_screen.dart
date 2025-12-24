import 'package:chat_app/screens/contact/contact_card.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController searchcon = TextEditingController();

  bool searched = false;
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
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceBright,
                      ),
                      onPressed: () {},
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
      appBar: AppBar(
        actions: [
          searched
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searched = false;
                    });
                  },
                  icon: Icon(Iconsax.close_circle),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searched = true;
                    });
                  },
                  icon: Icon(Iconsax.search_normal),
                ),
        ],
        title: searched
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: searchcon,
                      decoration: InputDecoration(
                        hintText: 'search by name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
            : Text('my contcts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ContactCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
