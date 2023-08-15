
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/const/product.dart';
import 'package:untitled1/backend/firebase.dart';
import 'package:untitled1/repo.dart';
import 'package:untitled1/screens/product%20screen.dart';

class HotStale extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var screen=MediaQuery.of(context).size;
    return   FutureBuilder(
      future: FireBase().getproduct(),
      builder: (context,snapshot) {

        print("jijifjifje${snapshot.toString()}");
        return Container( color: Colors.white,padding: const EdgeInsets.symmetric(vertical: 15),height:250,width:screen.width*3,child: Column(children: [
         // Container(height: 10,color: Colors.black,)
         Row(children: [const SizedBox(width: 10),const Text("Hot Sales",style: TextStyle(fontWeight: FontWeight.bold),),
           Expanded(child: Container()),Text("See all",style: TextStyle(color: Colors.blueGrey[500]),),  const SizedBox(width: 10,),]),
         const SizedBox(height: 10,),

         Expanded(child: ListView.builder(

             itemCount: snapshot.data?.length,

             scrollDirection:Axis.horizontal,itemBuilder: (context,index){
               var Prd= snapshot.data![index];
               return InkWell(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6)
                ,child:SizedBox(width:screen.width*0.42,height: 100,child:
                 Column(children: [ClipRRect(
                           clipBehavior: Clip.hardEdge,
                     borderRadius: BorderRadius.circular(10.0),
                     child: Image(fit : BoxFit.fitWidth,image: NetworkImage(Prd.prdlink[index]))
               ),
                  const SizedBox(height: 10,),
                   Row(children: [Text(Prd.prdname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: "Whereas recognition of the inherent dignity"),),
                    Expanded(child: Container()), Text(Prd.prdname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
        ]),
                const SizedBox(height: 10,),
                 const Text(maxLines: 2,overflow: TextOverflow.ellipsis,"The intuitive and intelligent WH-1000XM4 headphones intuitive and intelligent Wh-100",style:TextStyle(fontSize: 12,color: Colors.grey),)

        ],),)),onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:
                   (context)=>ProductScreen(product: Prd,
 ))),);
        }),)
   ],)

   );
      }
    );
  }


}