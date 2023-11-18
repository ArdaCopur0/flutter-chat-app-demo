// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_firebase1/screens/calls_page.dart';

import 'package:flutter_firebase1/screens/camera_page.dart';

import 'package:flutter_firebase1/screens/chats_page.dart';
// ignore: unused_import
import 'package:flutter_firebase1/screens/status_page.dart';
import 'package:flutter_firebase1/viewmodels/main_model.dart';

import "package:flutter_firebase1/core/locator.dart";


class UygMain extends StatefulWidget {
  const UygMain({ Key? key }) : super(key: key);

  @override
  State<UygMain> createState() => _UygMainState();
}

class _UygMainState extends State<UygMain> with SingleTickerProviderStateMixin {
    late TabController _tabController; 
   
    late  bool _showMessage = true;
    
 
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
    _tabController.addListener(() {
      _showMessage= _tabController.index !=0;
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   var model = getIt<MainModel>();

    return Scaffold(

      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: NestedScrollView( 
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,    
                  title: Text("bitirmeProje"),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),  
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),  
                      onPressed: () {},)
                  ],
                  
                )
              ];
            }, 
          body :Column(
            children: <Widget>[
            TabBar(
                controller: _tabController,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: "İletiler",),
            Tab(text: "Hikayeler",),
            Tab(text: "Aramalar",), 
            ],
            ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TabBarView(
                    controller: _tabController,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      CameraPage(),
                      ChatPage(),
                      StatusPage(),
                      CallPage(),
                   
                  ],
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
      floatingActionButton: _showMessage ? FloatingActionButton(
        child: Icon(Icons.message, color: Colors.white,),
        onPressed: () async { 
          await model.navigateToContacts();  
        },
      )
       : null,
    );
  }

}
