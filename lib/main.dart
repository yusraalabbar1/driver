import 'package:express/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isLogin = preferences.getBool('islogin');
  print("==============================");
  print(isLogin);

  runApp(MyApp());
}
