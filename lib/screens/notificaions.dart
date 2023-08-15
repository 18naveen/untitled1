
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/repo.dart';
import 'package:untitled1/screens/product%20screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const String  route="/Notification";


  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(title: Text("Notifications",style: TextStyle(color: Colors.black),),),
       body: ListView.builder(
           itemCount: product_url.notice_list.length,
           itemBuilder: (context,index){
             var prd=product_url.notice_list[index].product;
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 90,
                 child: ListTile(
          leading: Image(image: NetworkImage(prd.prdlink[0]),),
           title:  Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   Text(product_url.notice_list[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: "Whereas recognition of the inherent dignity"),),
                   SizedBox(height: 3,),
                    Text(maxLines: 2,overflow: TextOverflow.ellipsis,"${prd.prdname}: The intuitive and intelligent WH-1000XM4 headphones intuitive and intelligent Wh-100",style:TextStyle(fontSize: 15,color: Colors.grey),),
                 ],
           ),
   trailing: Column(
     children: [
       Text(product_url.notice_list[index].pricedrop,maxLines: 2,),
       Expanded(
         child: IconButton(icon: Icon(Icons.navigate_next),onPressed:()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen(product: prd))),),
       ),
     ],
   ),
           ),
               ),
             );

       })


       ,);
  }
}
