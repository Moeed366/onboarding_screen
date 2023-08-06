import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding_screen/screens/onboarding_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
        return MaterialApp(
          title: 'Flutter Onboarding UI',
          debugShowCheckedModeBanner: false,
          home: OnboardingScreen(),
        );
      }
    );
  }
}

