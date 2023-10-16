import 'package:flutter/material.dart';
import 'package:staff_food/pages/splash_screen.dart';
void main() => runApp(StartPage());

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Order",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      // home: Container(
      //   child: Text("App Starts From there"),
      // ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
