import 'package:flutter/material.dart';
import 'package:untitled1/const/product.dart';
import 'Notification.dart';


class product_url{
  static List<Product> prd_list=[
    Product(["https://images.pexels.com/photos/3394650/pexels-photo-3394650.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51OqRR2TkfL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71wSoXn0NBL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71-R3mH8BRL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71jmpWCg8ZL._SL1500_.jpg"],"aas1",[Colors.indigo,Colors.cyan,Colors.grey ]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61GgIV3tqRL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/I/516Os3AgisL._AC_SL1500_.jpg",],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/810JR81LIsL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61EXU8BuGZL._SL1100_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61eTrIO5GcL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61HHS0HrjpL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
    Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61SUj2aKoEL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),
  ];
  static const item1="https://images.pexels.com/photos/3394650/pexels-photo-3394650.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  static const item2="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61GgIV3tqRL._SL1500_.jpg";
  static const item3="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/810JR81LIsL._SL1500_.jpg";
  static const item4="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61EXU8BuGZL._SL1100_.jpg";
  static const item5="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71Ll7RaekYL._SL1500_.jpg";
  static const item6="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61eTrIO5GcL._SL1500_.jpg";
  static const item8="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61HHS0HrjpL._SL1500_.jpg";
  static const item7="https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61SUj2aKoEL._SL1500_.jpg";
  static const List<String> itemlist=[item1,item2,item3,item4,item5,item6,item7,item7,item1,item2,item3,item4,item5,item6,item7,item7];

  static List<notification> notice_list=[
    notification(Product(["https://images.pexels.com/photos/3394650/pexels-photo-3394650.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51OqRR2TkfL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71wSoXn0NBL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71-R3mH8BRL._SL1500_.jpg","https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71jmpWCg8ZL._SL1500_.jpg"],"aas1",[Colors.indigo,Colors.cyan,Colors.grey ]),"PriceDrop in one of your old fav product","334Rs off"),
    notification(Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/810JR81LIsL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]),"PriceDrop in one of your old fav product","20% off"),
    notification(Product(["https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/810JR81LIsL._SL1500_.jpg"],"aas1",[Colors.grey,Colors.blue,Colors.green]), "Product Notfication"," free delivery")
  ];



}