import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fake_store/core/colors.dart';
import 'package:fake_store/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> gotoHomeScreen() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () => Get.offAllNamed(AppRoutes.kHome),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => gotoHomeScreen(),
    );
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 35,
            color: AppColor.darkGrey,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: AppColor.darkGrey,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 50),
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText('FAKE STORE'),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}
