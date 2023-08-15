

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../const/user.dart';

class AuthData{

  static Future<String>  createUser(Users usr) async{
    late String msg;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: usr.email, password: usr.pass);
      await FirebaseFirestore.instance.collection("users").add(Users.toJson(usr));

      msg="Successful";
    }catch(e){
      msg=e.toString();
    }
    return msg;
  }



    static Future<String> emailLogin(id,pass)async{
  late String msg;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: id, password: pass);
      msg="Successful";
    }catch(e){
      msg=e.toString();
    }
    return msg;
  }


  // ignore: non_constant_identifier_names
  static Future<String> UsrIdLogin(String id,String pass)async{
    late String msg;
    try {
      await FirebaseFirestore.instance.collection("users").where("id",isEqualTo: id).get().onError((error, stackTrace) {
        msg=error.toString();
        return Future.error(error.toString());
      }).then((value) {if( value.docs.first.data()["password"] ==pass) {
        msg="Successful";
      }else{
        msg="IncorrectPassword";
      }
      }  );

      msg="Successful";
    }catch(e){
      msg=e.toString();
    }
    return msg;
  }


}