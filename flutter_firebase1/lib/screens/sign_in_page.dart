import 'package:flutter/material.dart';
import 'package:flutter_firebase1/core/locator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase1/viewmodels/sign_in_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _editingController = TextEditingController(); //giriş yapınca profille eşleşme için 
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<SignInModel>(),
      child: Consumer<SignInModel>(builder: (BuildContext context, SignInModel model, Widget? child) 
      => Scaffold(
        appBar: AppBar(
          title:  Text("Hoşgeldiniz"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: model.busy  //loading de sıkıntı 
          ? CircularProgressIndicator() //varsa
          : Column( //yoksa sayfayı getir
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Kullanıcı Adı"),
            TextField(
              controller: _editingController, //sign in methoduna gönderecek
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              splashColor: Colors.deepPurpleAccent,
              child: Text("Giriş Yap"), onPressed: () async => await model.signIn(_editingController.text),  //kullanıcı username tanımlasın
              )
          ],
          ),  
           ),
      ),),
    );
  }
}