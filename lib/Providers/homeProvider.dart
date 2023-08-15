

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../backend/firebase.dart';
import '../const/user.dart';

class HomeProvider extends ChangeNotifier{
  bool loading=true;
  String? id=FirebaseAuth.instance.currentUser?.uid;
  late Users user;
  late String result;
  // id=Firebase;
  Future<String> getuserdata()async{
    loading=true;
    notifyListeners();
    if(await FireBase.getuserdata(id!)==null){
      loading=false;
      notifyListeners();
      return "Failed";

    } else{
      loading=false;
      user=(await FireBase.getuserdata(id!))!;
      notifyListeners();
      return "Success";


    }
  }

}