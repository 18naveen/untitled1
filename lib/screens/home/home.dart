

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/home/widgets/hot%20sales.dart';
import 'package:untitled1/screens/home/widgets/recently.dart';
import 'package:untitled1/screens/home/widgets/top_products.dart';

import '../../Providers/homeProvider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String route="/Home";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getdata()async{
    var x=await Provider.of<HomeProvider>(context).getuserdata();
    if(context.mounted) {
    if(x=="Success"){
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("welcome back ${Provider.of<HomeProvider>(context).user.name}"),));

    }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("unable to get your data"),));
    }}


  }
  @override
  Widget build(BuildContext context) {
   return  Provider.of<HomeProvider>(context).loading?const Center(child: CircularProgressIndicator()):SafeArea(child: Scaffold(
     backgroundColor: Colors.white,
    body: ListView(
      shrinkWrap:true,
      children: [
      HotStale(),
        Recentview()

        // ListView(scrollDirection: Axis.horizontal,children: [GridTile(child: Text("sdsd"))],)
    ],),
    appBar: PreferredSize(preferredSize: const Size.fromHeight(120),
        child: AppBar(
            leading:const Padding(padding: EdgeInsets.only(top: 10,left: 10),child:Image(width: 100,
                image:  NetworkImage("https://th.bing.com/th/id/OIP.6PomTm873nIisK4Ew21eKAHaDA?pid=ImgDet&w=1024&h=415&rs=1")) ),
            title: Padding(
                padding: const EdgeInsets.only(top: 15,)
                ,child: TextField
              (decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "Search Something",
                filled: true,border: const
            OutlineInputBorder(
                borderSide:BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(5 )))
                ,fillColor: Colors.blueGrey[50]),)),
            bottom:const PreferredSize(
                preferredSize: Size.fromHeight(10.0), // adjust the height as needed
                child: TopProducts()),

        ))

    ));
  }
}
// Container(decoration: BoxDecoration(
// border: Border.all(color: Colors.grey),
// boxShadow: [BoxShadow(offset: Offset(2, 2))],
// borderRadius: BorderRadius.all(Radius.circular(15),
//
// ),
//
//
// ),child: widget,)