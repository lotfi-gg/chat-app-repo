import 'package:chat_app/screens/group/group_screen.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroupScreen()),
        ),
        leading: CircleAvatar(child: Text('G')),
        title: Text('name'),
        subtitle: Text('last msg'),
        trailing: Badge(padding: EdgeInsets.all(5), label: Text('2')),
      ),
    );
  }
}
