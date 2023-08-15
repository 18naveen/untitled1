import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/repo.dart';

import '../product screen.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  static const String route="/Cart";

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
   int address=1;
  @override
  Widget build(BuildContext context) {
    void bottom_sheet(){
     showModalBottomSheet(context: context, builder: (context)=>Container(
       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
       height: 300,child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Text("Have a coupon code? enter here 👇 "),
         TextField(decoration:InputDecoration(

             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),),
         Row(children:[ Text("Subtotal:",style:TextStyle(fontSize: 22,color: Colors.grey)),Expanded(child: Container(),), Text("Rs 80.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),]),
         Row(children:[ Text("Dilevery Fee:",style:TextStyle(fontSize: 22,color: Colors.grey)),Expanded(child: Container(),), Text("Rs 40.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),]),
         Row(children:[ Text("Discount:",style:TextStyle(fontSize: 22,color: Colors.grey)),Expanded(child: Container(),), Text("(50%) Rs200",style: TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 19),),]),
       Divider(),
         Row(children:[ Text("Total:",style:TextStyle(fontSize: 23,color: Colors.grey)),Expanded(child: Container(),), Text("-Rs200",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue),),]),
         SizedBox(height: 40,child: ElevatedButton(onPressed:(){}, child:Text("Continue")),width: 300,)
       ],
     ),));
    }
    return SafeArea(child: Scaffold(
      // bottomSheet: showBottomSheet(context: context, builder: (){return Container();}),
      bottomSheet: BottomSheet(onClosing: () { }, builder: (BuildContext context) {return ListTile(title: Text("234 items"),
        trailing: IconButton(icon: Icon(Icons.arrow_drop_up_outlined), onPressed: ()=>bottom_sheet(),),);  },),
      appBar:   PreferredSize(preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading:const Padding(padding: EdgeInsets.only(top: 10,left: 10),child:Image(width: 100,image:  NetworkImage("https://th.bing.com/th/id/OIP.6PomTm873nIisK4Ew21eKAHaDA?pid=ImgDet&w=1024&h=415&rs=1")) ),

            title: Padding(
                  padding: const EdgeInsets.only(top: 20,)
                  ,child: TextField
                (decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: "Search Something",
                  filled: true,border: const
              OutlineInputBorder(
                  borderSide:BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(5 )))
                  ,fillColor: Colors.blueGrey[50]),)),

          )),
        body: Column(
          children:  [
            ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            leading: const CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.L8bs33mJBAUBA01wBfJnjQAAAA?pid=ImgDet&rs=1"),),title: const Text("Name"),
                trailing:DropdownButton<int>(
                  // dropdownColor: Colors.blue,
                  iconEnabledColor: Colors.blueAccent,
                  focusColor: Colors.blue,
                    value: address,
                    alignment: Alignment.topCenter,
                    items: const [
                 DropdownMenuItem(value: 1, child: Text("Egmore Chennai"),),
                 DropdownMenuItem(value: 2, child: Text(" Chennai"),),
                 DropdownMenuItem(value: 3, child: Text(" Chennai"),),
                 DropdownMenuItem(value: 4, child: Text(" Chennai"),),
                 ] ,onChanged:(index){
                      setState(() {
                        address=index!;
                      });
                })),
            Expanded(child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50),
             itemBuilder: (context,index)=>  InkWell(
               onTap: ()=>Navigator.pushNamed(context, ProductScreen.route,arguments: product_url.prd_list[index]),

               child: Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Container(height: 130,child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[Card(elevation: 5,child:Image(fit: BoxFit.fill,image: NetworkImage(product_url.itemlist[index]),)),Container(width: 150,child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                      const Text("Sony Air M1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: "Whereas recognition of the inherent dignity"),),
                      const Text(maxLines: 2,overflow: TextOverflow.ellipsis,"The intuitive and intelligent WH-1000XM4 headphones intuitive and intelligent Wh-100",style:TextStyle(fontSize: 12,color: Colors.grey),),
                      Text("Rs 1234",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                      Row(children:  [
                        Expanded(child: Container()),
                        IconButton(onPressed: null, icon: Icon(Icons.add_box_outlined)),
                        Text("2"),
                        IconButton(onPressed: null, icon: Icon(Icons.exposure_minus_1)),

                      ],),
                    ],)),
                    ])
                )),
             )

              ,itemCount: product_url.itemlist.length,))
          ],
        ),
    ));
  }
}
