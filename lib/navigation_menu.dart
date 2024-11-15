import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';
import 'package:greenfarm_capstone_project/utils/constants/image_strings.dart';
import 'package:greenfarm_capstone_project/utils/helpers/helper_functions.dart';
import '../features/authentication/screens/sensorScreen/sensor_screen.dart';
import '../features/authentication/screens/addNewTree/homeScreen.dart';
import '../features/authentication/screens/irrigation/irrigationScreen.dart';
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon:Image(image: AssetImage(TImages.myFarmIcon)),
              label: 'My Farm',
            ),
            NavigationDestination(
              icon: Image(image: AssetImage(TImages.analyticIcon)),
              label: 'Analytics',
            ),
            NavigationDestination(
              icon: Image(image: AssetImage(TImages.irrigationIcons)),
              label: 'Irrigation',
            ),
            NavigationDestination(
              icon: Image(image: AssetImage(TImages.profileIcon)),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
      const SensorScreen(), HomeScreen(), IrrigationScreen(), Container(),

  ];
}
