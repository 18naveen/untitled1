
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled1/const/colorpellet.dart';

import '../const/product.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key,required Product this.product}) : super(key: key);
  Product product;
  static const String route="/productscreen";
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  int view_image=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        actions: [PopupMenuButton<String>(itemBuilder: (index)=>[const PopupMenuItem( child: Text("Delete Friends"),),const PopupMenuItem( child: Text("Edit Friends"),),const PopupMenuItem( child: Text("Close"),)])
        ],

        title: const Text("Details Products",style: TextStyle(color: Colors.black),),
        centerTitle: true,

      ),
      body: ListView(

        padding: const EdgeInsets.all(10),
        children: [

             SizedBox(
               height: 300,
             child:Column(
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Expanded(child: Image(image:
                     NetworkImage(widget.product.prdlink[view_image]),
                       height: 300,)),
                     SizedBox(
                       height: 300,width: 50,
                       child: ListView.builder(itemCount:4,
                           itemBuilder: (context,index)=>InkWell(onTap: ()=>setState(() {
                             view_image=index;

                            }),
                             child: Card(child: Image(height: 50,width: 50,image:NetworkImage(widget.product.prdlink[index],)),),)),
                     ),
                   ],
                 ),
               ],
             ) ,
             ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Container(
            padding: const EdgeInsets.all(5),
            decoration:BoxDecoration(color:Colour.primary,borderRadius:BorderRadius.circular(3)
            ) ,
            height: 25,

            child: const Text("Free Shipping",style: TextStyle(color: Colors.white),),),
           CircleAvatar(backgroundColor:Colors.white,
           child: IconButton(onPressed:(){} ,icon: const Icon(color: Colors.black12,Icons.favorite),),
           )
          ],),
        Text(widget.product.prdname,style: const TextStyle(fontWeight: FontWeight.w500,
        fontSize: 50
        ),),
          const Text(maxLines: 3,overflow: TextOverflow.ellipsis,"The intuitive and intelligent WH-1000XM4 headphones intuitive and intelligent Wh-100",style:TextStyle(fontSize: 17,color: Colors.grey),),
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 8.0),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           const Text("Rs 2000",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30)),
            SizedBox(
              height: 50,
              width: 120,
              child: ListView.builder(padding: const EdgeInsets.symmetric(vertical: 5),scrollDirection: Axis.horizontal,itemCount: widget.product.avl_colors.length,
                   itemBuilder:(contex,index)=>  Padding(
                     padding: const EdgeInsets.symmetric(vertical: 6.0),
                     child: CircleAvatar(
                           backgroundColor: Colors.black12,
                           child: Padding(
                             padding: const EdgeInsets.all(3),
                             child: CircleAvatar(
                               backgroundColor: widget.product.avl_colors[index],),
                           ),
                         ),
                   ),
                   ),
                   )


         ],),
       ),
    Row(
      children: [
      for (int i=0;i<3;i++)
        Align(
        widthFactor: 0.7,
        child: CircleAvatar(
          radius: 15,
    child: Text(i.toString()),
    )

      ),

      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(maxLines: 3,overflow: TextOverflow.ellipsis,"2500+ people pinned this",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
      ),

    ],),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("Have a coupon code? enter here 👇 ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
          ),
          TextField(decoration:InputDecoration(


              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),),



        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          const IconButton(onPressed: null, icon: Icon(Icons.add_box_outlined)),
          const Text("2"),
          const IconButton(onPressed: null, icon: Icon(Icons.exposure_minus_1)),
          Container(height: 40,decoration: BoxDecoration(color: Colors.cyan,borderRadius:BorderRadius.circular(10)),width: 200,child: ElevatedButton(onPressed:(){}, child:const Text("Continue")),),



        ],),
      ),
    ));
  }
}
