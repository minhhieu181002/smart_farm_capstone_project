
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarm_capstone_project/utils/constants/text_strings.dart';
import 'package:greenfarm_capstone_project/utils/theme/theme.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,


      home:const OnBoardingScreen(),
    );
  }
}