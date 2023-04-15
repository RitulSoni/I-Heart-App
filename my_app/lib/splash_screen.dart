import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363e5b),
      body: Center(
        child: Image.asset(
          'assets/I Heart Logo.png', // Replace with the logo
          height: 700,
          width: 700,
        ),
      ),
    );
  }
}
