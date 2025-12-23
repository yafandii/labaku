import 'package:boilerplate/data/constant/app_assets.dart';
import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:boilerplate/presentation/landing/landing_screen.dart';
import 'package:boilerplate/presentation/widgets/button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Onboarding extends StatefulWidget {
  static const routeName = '/onboarding';
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.onboardingImage,
                    height: MediaQuery.of(context).size.height * 0.4,
                  )
                      .animate()
                      .fade(duration: 500.ms)
                      .moveY(begin: 50, duration: 300.ms),
                  const SizedBox(height: 32),
                  Text(
                    "We provide high quality products just for you",
                    style: AppFont.text24Bold,
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn() // uses `Animate.defaultDuration`
                      .scale() // inherits duration from fadeIn
                      .move(
                          delay: 200.ms,
                          duration:
                              400.ms) // runs after the above w/new duration
                      .blurXY(begin: 3, end: 0, duration: 600.ms),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: BaseButton(
                title: "Get Started",
                color: AppColor.primaryColor,
                onTap: () =>
                    Navigator.pushNamed(context, LandingScreen.routeName),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
