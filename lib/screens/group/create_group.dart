import 'package:chat_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController gNamecon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('create group')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('done'),
        icon: Icon(Iconsax.tick_circle),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(radius: 40),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Iconsax.camera),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomField(
                    icon: Iconsax.user_octagon,
                    label: 'group name',
                    controller: gNamecon,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Row(children: [Text('members'), Spacer(), Text('0')]),
            Expanded(
              child: ListView(
                children: [
                  CheckboxListTile(
                    checkboxShape: CircleBorder(),
                    title: Text('lotfi'),
                    value: true,
                    onChanged: (value) {},
                  ),
                  CheckboxListTile(
                    checkboxShape: CircleBorder(),
                    title: Text('lotfi'),
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
