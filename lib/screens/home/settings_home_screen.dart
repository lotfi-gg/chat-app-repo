import 'package:chat_app/screens/settings/profile.dart';
import 'package:chat_app/screens/settings/qr_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:iconsax/iconsax.dart';

class SettingsHomeScreen extends StatefulWidget {
  const SettingsHomeScreen({super.key});

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  String username = FirebaseAuth.instance.currentUser!.displayName.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                minVerticalPadding: 40,
                leading: CircleAvatar(radius: 30),
                title: Text(username),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrCode()),
                    );
                  },
                  icon: Icon(Iconsax.scan),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  title: Text('profile'),
                  leading: Icon(Iconsax.user),
                  trailing: Icon(Iconsax.arrow_right),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: Colors.red,
                              onColorChanged: (value) {},
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('done'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  title: Text('theme'),
                  leading: Icon(Iconsax.color_swatch),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('dark mode'),
                  leading: Icon(Iconsax.user),
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () async => await FirebaseAuth.instance.signOut(),
                  title: Text('sign out'),

                  trailing: Icon(Iconsax.logout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
