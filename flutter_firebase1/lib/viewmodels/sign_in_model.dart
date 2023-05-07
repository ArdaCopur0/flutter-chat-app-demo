import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase1/core/locator.dart';
import 'package:flutter_firebase1/core/services/auth_service.dart';
import 'package:flutter_firebase1/viewmodels/base_model.dart';

class SignInModel extends BaseModel {
final AuthService _authService = getIt<AuthService>();  //service
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> signIn(String userName) async {
  if(userName.isEmpty) return; //username boşsa
  
  busy = true; //loading bari gostersin

try {
  var user = await _authService.signIn();  //sign in butonuna basınca islem 

 await  _firestore.collection("profil").doc(user!.uid).set({
    "userName": userName,
    "image" : "https://placekitten.com/200/200"
  });
} catch (e) {
  busy = false;  //sistem cökmemesi icin 
}
  busy = false; //loading islemi yok
}  
}