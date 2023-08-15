


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String route="/Profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget profile_element(String titile,String value){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Text(titile,style:TextStyle(fontSize: 20,color: Colors.grey)),

        Text(value,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      ],
    );
  }
  Widget profile_element2(Color clr,IconData icn,String title){
    return Container(

      decoration:BoxDecoration(color: clr,borderRadius: BorderRadius.circular(7)),
      height: 150,
      width: 110,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          IconButton(onPressed: (){}, icon:CircleAvatar(backgroundColor: Colors.white,child:  Icon(icn,color: clr,),)
          ),
          Text(title,style: TextStyle(fontSize: 19,color: Colors.black45),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[Expanded(child: Text("21 Items BUY NOW ",style: TextStyle(fontWeight: FontWeight.w500),)),IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward,color: Colors.black,))]
          )],
      ), );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile",style: TextStyle(color: Colors.black),),
        flexibleSpace: IconButton(icon: Icon(Icons.more_horiz,color: Colors.black,), onPressed: () {  },),),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Column(

        children: [Container(decoration:
        BoxDecoration(image: DecorationImage(fit:BoxFit.fitHeight,image: NetworkImage("https://wallpapercave.com/wp/wp4041548.jpg")),),
            height: 210,child: Stack(
          children: [
            Align(alignment: Alignment.center,child:Stack(children: const [
              CircleAvatar(radius: 50,backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.L8bs33mJBAUBA01wBfJnjQAAAA?pid=ImgDet&rs=1"),
                  child: Align(alignment: Alignment.bottomRight,child:InkWell(child:CircleAvatar(child: Icon(Icons.camera_alt),),onTap: null ,))
              )],))


          ],

        ) ),
          SizedBox(height: 10,),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              profile_element("Bought", "24"),
              profile_element("Reviewed", "24"),
              profile_element("Coupon", "24")
            ],),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // scrollDirection: Axis.horizontal,
            children: [
              profile_element2(Colors.redAccent[100]!, Icons.favorite,"Favorite"),
              profile_element2(Colors.blue[300]!, Icons.account_balance_wallet_sharp,"Saved"),
            ],

          ),
       TextButton(onPressed: (){}, child: Text("Buy Pro @Rs230",style: TextStyle(fontSize: 11,decoration: TextDecoration.underline),))
        ],
      ),)

    );
  }
}
