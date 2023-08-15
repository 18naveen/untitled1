import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/route.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/home/home.dart';
import 'package:untitled1/screens/login.dart';
import 'package:untitled1/screens/main_home.dart';
import 'package:untitled1/screens/register/register.dart';

import 'Providers/authprovider.dart';
import 'Providers/homeProvider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>HomeProvider()),

      ],child:const MyApp() ,)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        late String introuter;
        if(snapshot.connectionState==ConnectionState.active){

      if (snapshot.hasData) {
      introuter=DrashBoard.route;
    } else if (snapshot.hasError) {
       return Center(
       child: Text('${snapshot.error}'),
    );
        }else  {
      introuter=Register.route;
    }


    }if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: introuter,
          theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.white,
              appBarTheme:  const AppBarTheme(color: Colors.white)
          ),
          onGenerateRoute: RouteGenerator.generateRoute,

        );
      }
    );
  }
}
