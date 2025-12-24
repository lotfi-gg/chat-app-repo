import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Future createUser() async {
    User user = auth.currentUser!;
    ChatUser chatUser = ChatUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      about: 'hello i use this app',
      image: '',
      createdAt: DateTime.now().toString(),
      lastActivated: DateTime.now().toString(),
      puchToken: '',
      online: false,
    );

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
