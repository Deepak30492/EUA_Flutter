import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  ///SCROLL CONTROLLER
  final ScrollController scrollController = ScrollController();
  ThemeModeController _themeModeController = Get.put(ThemeModeController());

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = const Duration(milliseconds: 1500);
    return Timer(_duration, authenticate);
  }

  Future<void> authenticate() async {
    Navigator.of(context).push(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginPage(),
      transitionDuration: const Duration(milliseconds: 1400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to",
              style: AppTextStyle.splashScreenText,
            ),
            SizedBox(
              height: 300,
              width: 400,
              child: Center(
                child: Image.asset(
                  'assets/images/Mask Group 2.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
