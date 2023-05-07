// ignore: duplicate_ignore
// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase1/core/locator.dart';
import 'package:flutter_firebase1/screens/camera_page.dart';
import 'package:flutter_firebase1/screens/chats_page.dart';
import 'package:flutter_firebase1/screens/contacts_page.dart';
import 'package:flutter_firebase1/screens/conversation_page.dart';
import 'package:flutter_firebase1/screens/sign_in_page.dart';
// ignore: unused_import
import 'package:flutter_firebase1/uyg.main.dart';
// ignore: duplicate_import



void main() async{

  setupLocators(); // get_it paketinden servis classlarını initialize et

  WidgetsFlutterBinding.ensureInitialized();  //native code 
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Mesajlaşma Uygulamasi",
      theme: ThemeData(
      primarySwatch: Colors.indigo,
      
      ),
      home: const UygMain(),
    );
  }
}

