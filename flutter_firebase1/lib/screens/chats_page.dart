// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase1/models/conversation.dart';
import 'package:flutter_firebase1/screens/conversation_page.dart';
import 'package:flutter_firebase1/viewmodels/chats_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'conversation_page.dart';
// ignore: duplicate_import
import 'package:flutter_firebase1/viewmodels/chats_model.dart';
import "package:flutter_firebase1/core/locator.dart";
import 'package:flutter_firebase1/core/services/chat_service.dart';


class ChatPage extends StatelessWidget {
  final String userId = "TwVfwZVC2zYv20OCwoYJkajndM72";
  const ChatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var model = GetIt.instance<ChatsModel>();      
   
    // ignore: avoid_function_literals_in_foreach_calls, avoid_print
    
      //mesajlari cekme , stream
    return ChangeNotifierProvider(
      create: (BuildContext context) => model, 
      child: StreamBuilder<List<Conversation>>(
        stream: model.conversations(userId),  
        builder:
         (BuildContext context, AsyncSnapshot<List<Conversation>> snapshot) {
          if (snapshot.hasError){   
    
            return Text("Error:  ${snapshot.error}"); 
          }
    
          if(snapshot.connectionState == ConnectionState.waiting) { 
            return Text("Loading..");
          }
          return ListView(
            children: snapshot.data!.map((doc) => ListTile(
              leading: CircleAvatar(  
                backgroundImage: NetworkImage(doc.profileImage),  
              ),
              title: Text(doc.name),
              subtitle: Text(doc.displayMessage),
              trailing: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[  
                  Text("19.30"),   
                  Container(  
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      shape: BoxShape.circle, color: Theme.of(context).accentColor  //
                    ),
                    child: Center(
                      child: Text("4",  //mesaj sayısı geçici
                      textScaleFactor: 0.8,
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color:Colors.white ),
                      ),
                    ),
                  )   
                ],
              ),
              onTap: () {
                Navigator.push(          
                  context, MaterialPageRoute(builder:(content) => ConversationPage(userId: userId,
                   conversationId: doc.id,) ));
              },
    
    
            )).toList(),
          );
            
          
          },
        ),
    );
  }
}

