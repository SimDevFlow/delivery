import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_screen_test_project/material/color.dart';
import 'dart:async';

import 'package:three_screen_test_project/screen/get_start_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //status bar color change
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
    ));
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GetStartScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image(
          width: 141.31,
          height: 106,
          image: AssetImage("assets/images/wc_sc_logo.png"),
        ),
      ),
    );
  }
}
