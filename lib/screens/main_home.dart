
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/Cart/cart.dart';
import 'package:untitled1/screens/home/home.dart';
import 'package:untitled1/screens/notificaions.dart';
import 'package:untitled1/screens/profile.dart';

class DrashBoard extends StatefulWidget {
  const DrashBoard({Key? key}) : super(key: key);
  static const route="/DrashBoard";
  @override
  State<DrashBoard> createState() => _DrashBoardState();
}

class _DrashBoardState extends State<DrashBoard> {
  List<StatefulWidget> pages=[Home(),Cart(),NotificationScreen(),Profile()];
   int selected_page=0;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected_page],

      bottomNavigationBar: BottomNavigationBar(
      onTap: (index)=>setState(() {
        selected_page=index;
      }),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      currentIndex: selected_page,

      items:  const [
        BottomNavigationBarItem(label: "Home",activeIcon: Icon(Icons.home_filled,),icon: Icon( Icons.home),)
        , BottomNavigationBarItem(label: "Cart",activeIcon: Icon(Icons.shopping_cart_sharp,),icon: Icon( Icons.shopping_cart_outlined),)
        ,BottomNavigationBarItem(label: "Notification",activeIcon: Icon(Icons.notifications),icon: Icon( Icons.notifications_none_outlined,),)
        ,BottomNavigationBarItem(label: "Profile",activeIcon: Icon(Icons.account_circle,),icon: Icon( Icons.account_circle_outlined,),)
      ],),



      // body: Column(children: [
      //
      //   ListView.builder(itemBuilder: )
      //   ],),
      //,

    )  ;
  }
}
