import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fit_step_counter/controllers/app_controller.dart';
import 'package:google_fit_step_counter/screens/health_tracking.dart';
import 'package:google_fit_step_counter/screens/splash_screen.dart';

class ApplicationEntry extends StatelessWidget {
  const ApplicationEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        init: AppController(),
        builder: (appController) {
          if (!appController.splashCompleted.value) {
            return SplashScreen(appController: appController);
          }
          return const HealthTracking();
        });
  }
}
