// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushNamed(context, "/login");
    });

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
