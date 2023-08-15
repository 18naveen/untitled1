
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/const/product.dart';

import '../const/user.dart';
import '../home_provider.dart';

class FireBase{


  Future<List<Product>?> getproduct()async{
    List<Product> prdlist=[];
    try{

      var firebase=await FirebaseFirestore.instance.collection("products").get();

      for (var element in firebase.docs) {prdlist.add(Product.fromJson(element.data()));}

    }catch(e){
      return null;
    }
      return  prdlist;
  }


  Future<List<Product>?> getRecentProduct()async{

    List<Product> recent= [];

    try{
      var firebase=await FirebaseFirestore.instance.collection("recent").where("cid",isEqualTo: "wwwe").get();
      for (var element in firebase.docs.first.data()["id"]) {

        recent.add(await Productfromid(element));

      }

    }catch(e){
      return null;
    }
    return recent ;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<List<Product>?> getTopProduct()async{

    List<Product> toplst= [];

    try{
      var firebase=await FirebaseFirestore.instance.collection("featured").where("cid",isEqualTo: "wwwe").get();
      for (var element in firebase.docs.first.data()["id"]) {
        toplst.add(await Productfromid(element));
      }
    }catch(e){
      print("$e lpkfrrfo");
      return null;
    }
     return toplst ;
  }


  Future<Product> Productfromid(String prdid)async {
     Product prd;

    try{
      var firebase=await FirebaseFirestore.instance.collection("products").where("id",isEqualTo: prdid).get();
      prd= Product.fromJson(firebase.docs.first.data());
    }
    catch(e){
      print(e);
      print("e");
      return Product(["e"], "prdname", []);
    }
    return prd;
  }

  static Future<Users?> getuserdata(String usrid)async {
    Users? usr;
    try{
      var firebase=await FirebaseFirestore.instance.collection("users").where("id",isEqualTo: usrid).get();
      usr= Users.fromJson(firebase.docs.first.data());

      // Users.usr= usr;
      return usr;

    }
    catch(e){
      print(e);
      return null;

      //return Product(["e"], "prdname", []);
    }
  }


  }


