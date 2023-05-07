import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase1/models/conversation.dart';
import 'package:flutter/material.dart';

class ChatService {                // sohbetleri cek    
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    var ref = _firestore.collection("conversations")
    .where("members", arrayContains: userId);
    
   return ref.snapshots().map((list) => list.docs.map((snapshot) => Conversation.fromSnapshot(snapshot)).toList());
  }
  
}