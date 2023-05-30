import 'dart:async';

import 'package:customers_service/ui/home/home_screen.dart';
import 'package:customers_service/ui/login/login_screen.dart';
import 'package:customers_service/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "initial";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/madkour_group_splash.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
