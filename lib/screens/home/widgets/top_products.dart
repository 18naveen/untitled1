import 'package:flutter/material.dart';
import 'package:untitled1/backend/firebase.dart';
import '../../product screen.dart';

class TopProducts extends StatelessWidget {

  const TopProducts({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: FireBase().getTopProduct(),
        builder: (context,prdlist) {

         return prdlist == null ?   Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),child: CircularProgressIndicator(),)
          :Expanded(child:Padding(padding: const EdgeInsets.only(bottom: 5,top: 15),child:ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount:prdlist.data?.length,itemBuilder: (context,index)=>InkWell(
          onTap:()=>Navigator.push(context,MaterialPageRoute(builder:
              (context)=>ProductScreen(product: prdlist.data!.first,
           ))),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(

                  border: Border.all(color: Colors.grey),

                  borderRadius: const BorderRadius.all(Radius.circular(7),

                  ),


                ),height:5,child: Row(children: [Image(fit: BoxFit.fill,frameBuilder:(context,widget,index,tru)
                  =>Card(clipBehavior: Clip.hardEdge,child:widget,),
                  image:  NetworkImage(prdlist.data![index].prdlink[1].toString()))
                 ,const SizedBox(width: 5,),Text(prdlist.data![index].prdname)],)),
            ),
          ),

        )));
      }
    );
  }
}
