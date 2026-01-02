import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class FireData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  Future createRoom(String email) async {
    QuerySnapshot receiverEmail = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (receiverEmail.docs.isNotEmpty) {
      String receiverId = receiverEmail.docs.first.id;
      if (receiverId == myUid) {
        print('Cannot create room with yourself');
        return;
      }
      List<String> members = [myUid, receiverId]
        ..sort((a, b) => a.compareTo(b));
      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('members', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
          id: members.toString(),
          members: members,
          lastMessage: '',
          lastMessageTime: DateTime.now().toString(),
          createdAt: DateTime.now().toString(),
        );

        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      } else {
        print('room already exist');
      }
    } else {
      print('user not found');
    }
  }

  Future sendMessage(String uid, String msg, String roomId) async {
    print('calling the sendMessage function');
    String msgId = Uuid().v1();
    Message message = Message(
      id: msgId,
      toId: uid,
      fromId: myUid,
      msg: msg,
      type: 'text',
      createdAt: DateTime.now().toString(),
      read: '',
    );

    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(message.toJson());
  }
}
