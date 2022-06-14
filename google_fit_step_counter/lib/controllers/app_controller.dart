import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  bool isDarkMode = false;
  Rx<double> caloriesInKilo = 0.0.obs;
  Rx<double> totalSteps = 0.0.obs;
  RxBool splashCompleted = false.obs;
  final HealthFactory health = HealthFactory();
  final List<HealthDataAccess> permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
  ];

  @override
  onInit() {
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
    askPermissions().then((_) {
      fetchTotalNumberOfStepsToday();
    });
  }

  @override
  onClose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    fetchTotalNumberOfStepsToday();
  }

  set setSplashCompleted(bool value) {
    splashCompleted.value = value;
    update();
  }

  void initThemeMode(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    isDarkMode = brightness == Brightness.dark;
  }

  Future<void> askPermissions() async {
    try {
      await health.requestAuthorization(
          [HealthDataType.ACTIVE_ENERGY_BURNED, HealthDataType.STEPS],
          permissions: permissions);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchTotalNumberOfStepsToday() async {
    DateTime now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day);
    try {
      int? data = await health.getTotalStepsInInterval(midnight, now);
      totalSteps.value = double.parse(data?.toString() ?? "0.0".toString());
      List<HealthDataPoint> healthPoints = await health.getHealthDataFromTypes(
          midnight, now, [HealthDataType.ACTIVE_ENERGY_BURNED]);
      caloriesInKilo.value = healthPoints.fold(
          0.0,
          (double previousValue, element) =>
              double.parse(element.value.toJson()["numericValue"]) +
              previousValue);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
