import 'package:flutter/material.dart';
import 'package:login_app/views/screens/homepage.dart';
import 'package:login_app/views/screens/registerpage.dart';
import 'package:login_app/views/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;
  bool isRegister = prefs.getBool('isRegister') ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isRegister == false)
          ? 'register_page'
          : (isLogin == true)
              ? '/'
              : 'login_page',
      routes: {
        '/': (context) => const HomePage(),
        'register_page': (context) => const RegisterPage(),
        'login_page': (context) => const LoginPage(),
      },
    ),
  );
}
