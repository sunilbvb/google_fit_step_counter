import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:google_fit_step_counter/controllers/app_controller.dart';
import 'package:google_fit_step_counter/utils/constants.dart';
import 'package:google_fit_step_counter/screens/widgets.dart';

class CaloriesCount extends StatelessWidget {
  const CaloriesCount({Key? key, required this.appController})
      : super(key: key);
  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: renderBoxDecoration(appController.isDarkMode),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Calories Burned:\t",
                    style: Constant.textStyle16.copyWith(
                        color:
                            !appController.isDarkMode ? Colors.black : null)),
                WidgetSpan(
                  child: Obx(
                    () => Text(
                        appController.caloriesInKilo.value.toInt().toString(),
                        style: Constant.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: renderColor(!appController.isDarkMode))),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return FAProgressBar(
                        size: 16,
                        backgroundColor:
                            renderProgressBGColor(appController.isDarkMode),
                        currentValue: appController.caloriesInKilo.value,
                        maxValue: 1000,
                        changeProgressColor: appController.isDarkMode
                            ? Colors.white
                            : Colors.black,
                        changeColorValue: 1,
                      );
                    }),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("0", style: Constant.textStyle10),
                          Text("Goal: 1000", style: Constant.textStyle10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              renderImage(Constant.assetCalories, appController.isDarkMode),
            ],
          ),
        ],
      ),
    );
  }
}