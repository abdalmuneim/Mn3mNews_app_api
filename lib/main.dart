import 'package:flutter/material.dart';
import '../screens_builder/first_open.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens_builder/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool decision = preferences.getBool('view');
  Widget screens = (decision == false || decision == null) ? FirstOpen() : HomePage();
  runApp(MyApp(qScreens: screens));
}

class MyApp extends StatelessWidget {
  final Widget qScreens;

  const MyApp({this.qScreens});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // home: screens,
      routes: {
        '/': (context) => qScreens,
        HomePage.routName: (context) => HomePage(),
      },
    );
  }
}
