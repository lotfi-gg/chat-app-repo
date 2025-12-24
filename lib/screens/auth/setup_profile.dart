import 'package:chat_app/firebase/fire_auth.dart';
import 'package:chat_app/utils/color.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController namecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Iconsax.logout),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const logo(),
            SizedBox(height: 20),

            Text('welcome', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              'enter your name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            CustomField(
              icon: Iconsax.user,
              label: 'eamil',
              controller: namecon,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (namecon.text.isNotEmpty) {
                  await FirebaseAuth.instance.currentUser!
                      .updateDisplayName(namecon.text)
                      .then((value) => FireAuth.createUser());
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: myPrimaryColor,
                padding: EdgeInsets.all(16),
              ),
              child: Center(
                child: Text(
                  'continue'.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
