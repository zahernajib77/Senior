import 'package:flutter/material.dart';
import 'package:go2parts/screens/account.dart';
import 'package:go2parts/screens/forgot_password_page.dart';
import 'package:go2parts/screens/home.dart';
import 'package:go2parts/screens/login.dart';
import 'package:go2parts/screens/orderhistory.dart';
import 'package:go2parts/screens/profile.dart';
import 'package:go2parts/screens/profilepage.dart';
import 'package:go2parts/screens/settings.dart';
import 'package:go2parts/screens/signup.dart';
import'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:adaptive_theme/adaptive_theme.dart';

import 'config/config.dart';

bool darkmode=false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AutoParts.preferences=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = HexColor('#3973E3');
    Color _accentColor = HexColor('#8A02AE');
    Firebase.initializeApp();


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Go2Parts',

      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,

      ),

      home:Homepage(),
      //SplashScreen(title: 'Flutter Login UI'),



    );
  }
}
