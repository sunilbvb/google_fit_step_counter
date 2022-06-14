import 'package:flutter/material.dart';
import 'package:google_fit_step_counter/utils/constants.dart';

Widget renderImage(String imageAsset, bool isDarkMode) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Image.asset(
      imageAsset,
      color: isDarkMode ? Colors.white : null,
    ),
  );
}

BoxDecoration renderBoxDecoration(bool isDarkMode) {
  return BoxDecoration(
      color: isDarkMode ? const Color(0xff323232) : const Color(0xffF0F0F0),
      borderRadius: BorderRadius.circular(24));
}

Color? renderColor(bool isDarkMode) {
  return !isDarkMode ? null : Colors.black;
}

Color renderProgressBGColor(bool isDarkMode) {
  return isDarkMode ? const Color(0xff8A8A8A) : const Color(0xffC4C4C4);
}

final Map<int, Widget> splashScreenImages = {
  1: SizedBox(
      key: UniqueKey(),
      height: 200,
      width: 200,
      child: Image.asset(Constant.assetPin)),
  2: SizedBox(
      height: 200,
      width: 200,
      key: UniqueKey(),
      child: Image.asset(Constant.assetBoozinLogo)),
  3: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    key: UniqueKey(),
    children: [
      Image.asset(Constant.assetBoozinLogo),
      const SizedBox(height: 2),
      Image.asset(Constant.assetFitness, height: 20),
    ],
  )
};