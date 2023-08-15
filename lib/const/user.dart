

import 'package:untitled1/Notification.dart';

class Users{
  final String  name;
  final String  email;
  final String  id;
  final String  pass;
  final String  addresses;
  final String  notifications;
  final String  cart;
  final String  bought;
  final String  reviewed;
  final bool  ispro;

  static late final Users _user;

  static set usr(Users value){
    _user = value;
  }
  Users get user =>_user;

  final String  coupons;
  Users(this.name,this.pass, this.addresses, this.notifications, this.bought, this.reviewed, this.coupons, this.ispro, this.cart, this.email, this.id,);

  static Users fromJson(Map<String,dynamic> fromjsom){

    return Users(
      fromjsom["name"],
      fromjsom["email"],
      fromjsom["pass"],
      fromjsom["id"],
      fromjsom["address"].map((e)=>e.toString()).toList(),
      fromjsom["notifications"].map((e)=>e.toString()).toList(),
      fromjsom["cart"].map((e)=>e.toString()).toList(),
      fromjsom["bought"],
      fromjsom["reviewed"],
      fromjsom["coupons"],
      fromjsom["pro"],

    );
  }
  static Map<String,dynamic> toJson(Users user){

    return {

      "name":user.name,
      "email":user.email,
      "pass":user.pass,
      "id":user.id,
      "address":user.addresses,
      "notifications":user.notifications,
      "cart":user.cart,
      "bought":user.bought,
      "reviewed":user.reviewed,
      "coupons":user.coupons,
      "pro":user.ispro,

    };
  }
}