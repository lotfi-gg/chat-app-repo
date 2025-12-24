import 'package:chat_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecon = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecon.text = 'lotfi';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(radius: 70),
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: IconButton.filled(
                        onPressed: () {},
                        icon: Icon(Iconsax.edit),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Iconsax.user),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.edit),
                  ),
                  title: TextField(
                    enabled: false,
                    controller: namecon,
                    decoration: InputDecoration(
                      labelText: 'name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Iconsax.user),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.edit),
                  ),
                  title: TextField(
                    enabled: false,
                    controller: namecon,
                    decoration: InputDecoration(
                      labelText: 'about',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Iconsax.direct),
                  title: Text('email'),
                  subtitle: Text('lotfi@gmajil.com'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Iconsax.direct),
                  title: Text('joined on'),
                  subtitle: Text('march 2025'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: myPrimaryColor,
                  padding: EdgeInsets.all(16),
                ),
                child: Center(
                  child: Text(
                    'save'.toUpperCase(),
                    style: const TextStyle(color: Colors.black),
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
