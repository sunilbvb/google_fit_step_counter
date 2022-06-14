import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fit_step_counter/controllers/app_controller.dart';
import 'package:google_fit_step_counter/screens/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.appController}) : super(key: key);
  final AppController appController;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (count == 3) {
        final AppController appController = Get.put(AppController());
        appController.setSplashCompleted = true;
        timer.cancel();
        return;
      }
      setState(() => count += 1);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renderColor(widget.appController.isDarkMode),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 2000),
          switchInCurve: Curves.easeIn,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final rotate = Tween(begin: pi, end: 0.0).animate(animation);
            return AnimatedBuilder(
              animation: rotate,
              child: child,
              builder: (BuildContext context, Widget? child) {
                final angle = (const ValueKey("uniqueKey") != widget.key)
                    ? min(rotate.value, pi / 2)
                    : rotate.value;
                return Transform(
                  transform: Matrix4.rotationY(angle),
                  child: child,
                  alignment: Alignment.center,
                );
              },
            );
          },
          child: splashScreenImages[count],
        ),
      ),
    );
  }
}