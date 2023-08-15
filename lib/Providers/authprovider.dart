

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../backend/auth.dart';
import '../const/user.dart';

enum log {Register,emailLogin,IdLogin}

class AuthProvider extends ChangeNotifier{
  late Users currentuser;
  late String result;
  late bool logedin=false;
  late bool loading=false;
void loginUser(log logtype,id,pass, {Users? usr})async{
     logedin=false;
     loading=true;
     notifyListeners();
  if(logtype==log.IdLogin){
     result= await AuthData.UsrIdLogin(id, pass);
   }else  if(logtype==log.emailLogin){
  result=await  AuthData.emailLogin(id, pass);
  }else if(usr!=null){
   result=await AuthData.createUser(usr);
  }
  loading=false;
  logedin=true;
  notifyListeners();
  // return result;
  }

}


