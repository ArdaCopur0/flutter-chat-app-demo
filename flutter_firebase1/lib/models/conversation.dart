import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter_firebase1/screens/conversation_page.dart';

class Conversation {
  String id;
  String name;
  String profileImage;
  String displayMessage;

  Conversation({required this.id, required this.name, required this.profileImage, required this.displayMessage}); 

  factory Conversation.fromSnapshot(DocumentSnapshot snapshot) {
    return Conversation(id: snapshot.id, name: "Arda",
     profileImage: "https://placekitten.com/200/200", 
     displayMessage: snapshot.data()!["displayMessage"]);
  }
}