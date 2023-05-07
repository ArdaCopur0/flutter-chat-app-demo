import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase1/core/services/chat_service.dart';
import 'package:flutter_firebase1/models/conversation.dart';
import 'package:flutter_firebase1/viewmodels/base_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';

class ChatsModel extends BaseModel {
  final ChatService _db = GetIt.instance<ChatService>(); //firestore cekme

  Stream<List<Conversation>> conversations (String userId) {
    return _db.getConversations(userId);
  }
}