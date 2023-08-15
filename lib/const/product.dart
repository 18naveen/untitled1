

import 'package:flutter/material.dart';

class Product {
  Product(this.prdlink,this.prdname,this.avl_colors);
  List prdlink;
  List<MaterialColor>avl_colors;
  String prdname;
  static Product fromJson(Map<String,dynamic> fromjsom){

    return Product(fromjsom["Images"].map((e)=>e.toString()).toList(),
         fromjsom["name"],
         [Colors.cyan,Colors.grey,Colors.blueGrey],
     );
  }
}