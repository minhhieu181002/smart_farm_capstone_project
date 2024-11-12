import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarm_capstone_project/features/authentication/screens/login/widgets/login_header.dart';
import 'package:greenfarm_capstone_project/navigation_menu.dart';
import 'package:greenfarm_capstone_project/utils/constants/image_strings.dart';
import 'package:greenfarm_capstone_project/utils/constants/sizes.dart';
import 'package:greenfarm_capstone_project/utils/helpers/helper_functions.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/container/rounded_container.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image with opacity


          // Scrollable content on top of the background
          SingleChildScrollView(
            child: Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  // Logo, Title , subtitle
                  const LoginHeader(),

                  const SizedBox(height: TSizes.spaceBtwSections * 3),

                  Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: RoundedContainer(
                      margin: const EdgeInsets.only(top: TSizes.lg, left: TSizes.sm),
                      height: THelperFunctions.screenHeight() * 0.4,
                      width: THelperFunctions.screenWidth() * 0.8,
                      showBorder: true,
                      backgroundColor: Colors.white,
                      child: Column(
                        children: [
                          // Logo
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(top: TSizes.sm),
                            padding: const EdgeInsets.all(TSizes.sm),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Image.asset(
                              TImages.greenFarmLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Text
                          const SizedBox(height: TSizes.spaceBtwSections),
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.green),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections * 2),

                          // Login bar
                          Padding(
                            padding:
                            const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
                            child: SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: ()=>Get.to(()=>const NavigationMenu()),
                                icon: Image.asset(
                                  TImages.google,
                                  height: TSizes.iconLg,
                                  width: TSizes.iconLg,
                                ),
                                label: const Text(TTexts.signIn),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
