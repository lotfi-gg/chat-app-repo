import 'package:chat_app/screens/auth/forget_screen.dart';
import 'package:chat_app/utils/color.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const logo(),
              SizedBox(height: 20),

              Text('hello', style: Theme.of(context).textTheme.headlineLarge),
              Text(
                'chat app made by me',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              CustomField(
                icon: Iconsax.user,
                label: 'eamil',
                controller: emailcon,
              ),

              CustomField(
                icon: Iconsax.direct,
                label: 'password',
                controller: passwordcon,
                isPass: true,
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    child: const Text('forget password'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: emailcon.text,
                          password: passwordcon.text,
                        )
                        .then((value) => print('user signed in '))
                        .onError(
                          (error, stackTrace) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(error.toString())),
                              ),
                        );
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
                    'login'.toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SetupProfile()),
                  // );
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: emailcon.text,
                        password: passwordcon.text,
                      )
                      .then((value) => print('create user'))
                      .onError(
                        (error, stackTrace) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString())),
                            ),
                      );
                },

                child: Center(
                  child: Text(
                    'create account'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
