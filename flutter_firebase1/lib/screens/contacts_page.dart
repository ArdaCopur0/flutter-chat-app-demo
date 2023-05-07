import 'package:flutter/material.dart';


class ContactsPage extends StatelessWidget {
  const ContactsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
     appBar: AppBar(title: Text("Yeni ileti gönder"),
     actions: <Widget> [
      IconButton(icon: Icon(Icons.search),
      onPressed: () {
        showSearch(context: context, delegate: ContactSearchDelegate());
      },
      ),
      IconButton(icon: Icon(Icons.more_vert),
      onPressed: () {},
      ),
     ],
     ),
     body: ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.group, color: Colors.white,),),
        title: Text("Yeni grup"),
      ),
      ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.person_add, color: Colors.white,),),
        title: Text("Yeni kişi"),
      )
      ],
     ),
    );
  }
}

class ContactSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      primaryColor: Color(0xFF9C27B0),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
  return [Icon(Icons.tab)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return IconButton( icon: Icon(Icons.arrow_back), onPressed: () { 
    close(context, null);
   },);
  }

  @override
  Widget buildResults(BuildContext context) {
     return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container();
  }
}