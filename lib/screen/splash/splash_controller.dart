import 'package:get/get.dart';
import 'package:weather_app/screen/dashboard/dahsboard.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      navigateToHomeScreen();
    });
    super.onInit();
  }

  void navigateToHomeScreen() {
    Get.offAll(() => const Dashboard());
  }
}
