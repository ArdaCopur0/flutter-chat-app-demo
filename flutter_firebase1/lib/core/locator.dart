import 'package:flutter_firebase1/core/services/auth_service.dart';
import 'package:flutter_firebase1/core/services/chat_service.dart';
import 'package:flutter_firebase1/viewmodels/chats_model.dart';
import 'package:flutter_firebase1/viewmodels/contacts_model.dart';
import 'package:flutter_firebase1/viewmodels/main_model.dart';
import 'package:flutter_firebase1/viewmodels/sign_in_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:get_it/get_it.dart";

GetIt getIt = GetIt.instance;


setupLocators(){
getIt.registerLazySingleton(() => ChatService()); //firestoredb'yi initalize ettik, ne zaman ihtiyacımız olursa döner
getIt.registerLazySingleton(() => AuthService());

getIt.registerFactory(() => ChatsModel());
getIt.registerFactory(() => SignInModel());  //chatsmodel factory classını tanımladık
getIt.registerFactory(() => MainModel());
getIt.registerFactory(() => ContactsModel());
}