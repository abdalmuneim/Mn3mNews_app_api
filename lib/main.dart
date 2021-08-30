import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import '../views/first_open.dart';
import '../views/homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool decision = preferences.getBool('view');
  Widget _screens =
      (decision == false || decision == null) ? FirstOpen() : HomePage();

  runApp(MyApp(screens: _screens));
}

class MyApp extends StatelessWidget {
  final Widget screens;

  const MyApp({this.screens});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // home: screens,
      routes: {
        '/': (context) => screens,
        HomePage.routName: (context) => HomePage(),
      },
    );
  }
}
