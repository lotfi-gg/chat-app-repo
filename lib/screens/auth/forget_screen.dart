import 'package:chat_app/utils/color.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const logo(),
            SizedBox(height: 20),

            Text(
              'forgot password',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'enter your email',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            CustomField(
              icon: Iconsax.user,
              label: 'eamil',
              controller: emailcon,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailcon.text)
                    .then((value) {
                      Navigator.pop(context);
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('verify your email please '),
                        ),
                      );
                    })
                    .onError(
                      (error, stackTrace) => ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(error.toString()))),
                    );
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
                  'send email'.toUpperCase(),
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
