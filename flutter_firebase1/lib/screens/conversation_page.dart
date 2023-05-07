// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;

  const ConversationPage({ Key? key,    required this.userId,    required this.conversationId }) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  // ignore: unused_field
  final TextEditingController _editingController = TextEditingController();  //mesajları almak için, text field'a bu parametre ekle
  
  // ignore: unused_field
  late CollectionReference _ref; 


 @override
  void initState() {
    _ref = FirebaseFirestore.instance.collection("conversations/${widget.conversationId}/messages");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        // ignore: prefer_const_literals_to_create_immutables
        title: Row(children: <Widget>[
          // ignore: prefer_const_constructors
          CircleAvatar(
            backgroundImage:NetworkImage("https://placekitten.com/200/200"),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            // ignore: prefer_const_constructors
            child: Text("Arda Çopur"),
          )
        ],
        ),

         actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Icon(Icons.phone) ,
              onTap: () {},
              ),
          ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                child: Icon(Icons.camera_alt_rounded),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                child: Icon(Icons.more_vert),
              onTap: () {},
              ),
            )
         ],

      ),
       body: Container(                    
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://placekitten.com/600/800"))),       //geçici 
         child: Column(
           children: <Widget>[
             Expanded(
               child: StreamBuilder(  //sayısına göre anlık mesaj gözükmesi
                 stream: _ref.orderBy("timeStamp").snapshots(),  //son mesajın en alta düşmesi
                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                   return !snapshot.hasData
                   ? CircularProgressIndicator()
                   : ListView(                  
                    children: snapshot.data!.docs.map((document)=>ListTile(
                      title: Align(
                        alignment: widget.userId   != document["senderId"]    //eşitse mesajı sağa , değilse sola yasla  
                         ? Alignment.centerLeft
                         : Alignment.centerRight,
                         child: Container(
                          padding: EdgeInsets.all(8), //mesaj background
                          decoration: BoxDecoration
                          (color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.horizontal(  //mesaj blogunu sekillendirme
                          left: Radius.circular(10),  
                          right: Radius.circular(10))),
                          child: Text(
                            document["message"], 
                            style: TextStyle(color: Colors.white),))),
                    ),   
                    )
                   .toList(),
                   );
                 }
               ),
             ),
             Row(            //mesaj yazma alanı start
              children: <Widget>[
                Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white,
                   borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25), 
                    right: Radius.circular(25),
                    ),
                    ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child:Icon(Icons.tag_faces,    
                          color: Colors.black38,),
                        ),
                      ),
                      Expanded(
                        child: TextField(  
                          controller: _editingController,                
                        decoration: InputDecoration(hintText: "Mesaj yaz",
                        border: InputBorder.none)),
                      ),
                      InkWell(
                        child: Icon(  
                          Icons.file_copy_outlined,          
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(  
                          child: Icon(
                            Icons.camera_alt,   
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container( //mesaj gönder kısmı start
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(shape:BoxShape.circle, color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.white,),
                  onPressed: () async{
                    await _ref.add({
                      "senderId": widget.userId, //mesajı gönderenin userID sinin alınması
                      "message": _editingController.text,
                      "timeStamp": DateTime.now()   
                    });
                    _editingController.text = "";    //gönderilen mesajın kaydedilmesi
                  },
                ),
              )
              ],  
             )
           ],
         ),
       ),


    );
  }
}