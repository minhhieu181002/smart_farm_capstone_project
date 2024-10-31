import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:greenfarm_capstone_project/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:greenfarm_capstone_project/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:greenfarm_capstone_project/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:greenfarm_capstone_project/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:greenfarm_capstone_project/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:greenfarm_capstone_project/utils/constants/image_strings.dart';
import 'package:greenfarm_capstone_project/utils/constants/sizes.dart';
import 'package:greenfarm_capstone_project/utils/constants/text_strings.dart';
import 'package:greenfarm_capstone_project/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator
          ,
          children: [
            OnboardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,

            ),
            OnboardingPage(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,

            ),
            OnboardingPage(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,

            ),

          ]),

          const OnboardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
