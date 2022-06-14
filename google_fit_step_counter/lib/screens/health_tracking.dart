import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fit_step_counter/controllers/app_controller.dart';
import 'package:google_fit_step_counter/screens/calories_count.dart';
import 'package:google_fit_step_counter/utils/constants.dart';
import 'package:google_fit_step_counter/screens/steps_count.dart';
import 'package:google_fit_step_counter/screens/widgets.dart';

class HealthTracking extends StatelessWidget {
  const HealthTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    appController.initThemeMode(context);
    return Scaffold(
      backgroundColor: renderColor(appController.isDarkMode),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hi!",
          style: Constant.textStyle32
              .copyWith(color: renderColor(!appController.isDarkMode)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            StepsCount(appController: appController),
            const SizedBox(height: 20),
            CaloriesCount(appController: appController),
          ],
        ),
      ),
    );
  }
}