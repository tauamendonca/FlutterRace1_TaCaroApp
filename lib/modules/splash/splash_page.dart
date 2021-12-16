// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:tacaro/modules/login/login_page.dart';
//import 'package:tacaro/shared/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //código original
    // Future.delayed(Duration(seconds: 3)).then((value) {
    //   Navigator.pushNamed(context, "/login");
    // });
    //return Scaffold(
    //Código original do fundo:
    //backgroundColor: AppTheme.colors.background,
    // body: Center(
    //   child: Image.asset("assets/images/logo.png"),
    // ),
    // );
    return SplashScreen.navigate(
      name: 'assets/animations/tacaro.riv',
      next: (context) => LoginPage(),
      until: () => Future.delayed(Duration(seconds: 3)),
      endAnimation: 'Animation 1',
      backgroundColor: Colors.white,
    );
  }
}
