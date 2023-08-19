import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:task_management/screens/register.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/wrapper.dart';
import 'screens/register.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
   
    onGenerateRoute:  (RouteSettings routeSettings) {
      return MaterialPageRoute<void>(
              settings: routeSettings,
         builder: (BuildContext context) {
         switch (routeSettings.name) {
          case Wrapper.routeName:
          return const Wrapper();
          case HomeScreen.routeName:
          return  const HomeScreen();
          case MyLogin.routeName:
          return  const MyLogin();
          case MyRegister.routeName:
          return  const MyRegister();
          default: const Wrapper();
         }  
         return const Wrapper();
         },   
      );
    }
    ,
  ));
}




