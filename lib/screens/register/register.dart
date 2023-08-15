import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/authprovider.dart';
import '../../backend/auth.dart';
import '../../const/user.dart';
import '../main_home.dart';



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const  String route="/Register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool login =true;
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  TextEditingController t4=TextEditingController();
  TextEditingController t5=TextEditingController();
  bool loading =false;
  OnSubmit()async{
    late String result;
    setState(() {
      bool loading =true;

    });
    if(login){
      if( t1.text.isEmpty||t2.text.isEmpty||
          t1.text.length<6||t2.text.length<6
      ){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Invalid Id /password"),));

        // showDialog(context: context, builder: (context)=>const SnackBar(content: Text("Invalid Id /password"),));
        // const SnackBar(content: Text("Invalid Id /password"),);
      }else{
        if(t1.text.endsWith(".com")){
          result = await AuthData.emailLogin( t1.text, t2.text);

        }else{
          result = await AuthData.UsrIdLogin( t1.text, t2.text);

        }
      }
    }
    else{
      if(
      t1.text.isEmpty||t2.text.isEmpty||
          t3.text.isEmpty||t4.text.isEmpty||
          t1.text.length<6||t2.text.length<6||
          t3.text.length<6||t4.text.length<6
      ){
        print("/////////////////////////invalid////////////////////");
        // const SnackBar(content: Text("Invalid Id /password"),);
        // showDialog(context: context, builder: (context)=>const SnackBar(content: Text("Invalid Id /password"),));

        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Invalid Id /password"),));

      }else{
        result = await AuthData.createUser(Users(
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          false,
          "",
          "",
          "",
        ) );

        // String x=await auth.createUser(t1.text, t2.text);
      }
    }
    setState(() {
      loading=false;
    });
    if(
    result=="Successful"){
      if(context.mounted){Navigator.pushNamed(context,DrashBoard.route);}
    }else{
      if(context.mounted) {
         ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text("Something gone wrong $result "),));}
      // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Something gone wrong"),));
      // showDialog(context: context, builder: (context)=>const SnackBar(content: Text("Something gown wrong"),));

      // const SnackBar(content: Text("Something gown wrong"),);

    }

  }

  Widget Customtextfield( control,String hint,IconData icn ,
      {bool pass = false}){
    return TextField(controller:control ,

      obscureText: pass,
      decoration: InputDecoration(
        suffixIcon: Icon(icn),
        hintText: hint,

        filled: true,border: const
    OutlineInputBorder(
        borderSide:BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(5 )))
        ,fillColor: Colors.blueGrey[50]),
    );

  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:loading?
         const Center(child: CircularProgressIndicator(),):
      Center(

       child:  Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             height: size.height*0.74,
             width: size.width*0.7,

              child: Column(
                children: [
                  login ?Column(

                    children: [

                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Login",style: TextStyle(fontSize: 30),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Customtextfield(t1, "Emain/User",Icons.alternate_email),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Customtextfield(t2, "password",Icons.lock,pass: true),
                      ),

                    ],
                  ): Expanded(
                    child: ListView(
                      // padding: EdgeInsets.all(10),
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [

                        const Center(child: Text("Register",style: TextStyle(fontSize: 20),)),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Customtextfield(t4, "name",Icons.account_circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Customtextfield(t1, "Emain",Icons.alternate_email),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Customtextfield(t3, "phone",Icons.phone),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Customtextfield(t2, "password",Icons.edit,pass: true),

                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: ()=>OnSubmit()
                        , child: login?const Text("login "):const Text("Create")),
                  ),],
              ),

            ),

           Padding(
             padding: const EdgeInsets.all(20.0),
             child: TextButton(onPressed: ()=>

                 setState(() {
               login=!login;
             }), child: !login?const Text("login Account"):const Text("Create Account")),
           )
         ],
       )
      ),
    );
  }
}
