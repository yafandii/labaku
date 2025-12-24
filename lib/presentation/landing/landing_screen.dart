import 'dart:io';

import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/constant/app_color.dart';
import 'package:labaku/data/constant/app_font.dart';
import 'package:labaku/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:labaku/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:labaku/presentation/landing/widget/social_media_button.dart';
import 'package:labaku/presentation/widgets/button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = '/login';
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            sectionHeader(),
            const SizedBox(height: 32),
            sectionLoginSocialMedia(),
            const SizedBox(height: 32),
            sectionDivider(),
            const SizedBox(height: 32),
            sectionSignupButton(),
          ],
        ),
      ),
    );
  }

  Column sectionHeader() {
    return Column(
      children: [
        Image.asset(
          AppAssets.loginImage,
          height: 200,
        ).animate().fade(duration: 500.ms).moveY(begin: 50, duration: 300.ms),
        const SizedBox(height: 24),
        Text(
          "Let's you in",
          style: AppFont.text30Bold,
        )
            .animate()
            .fadeIn()
            .scale()
            .move(delay: 200.ms, duration: 300.ms)
            .blurXY(begin: 5, end: 0),
      ],
    );
  }

  Widget sectionSignupButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: BaseButton(
            title: "Sign in with password",
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
          ),
        ).animate().fadeIn().scale(begin: const Offset(0, 1)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: AppFont.text12Normal.copyWith(
                  color: AppColor.primaryColor.withValues(alpha: .5),
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, SignUpScreen.routeName),
                child: Text(
                  "Sign up",
                  style: AppFont.text12Bold.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ).animate().fadeIn().scale().moveY(begin: 50, duration: 300.ms),
      ],
    );
  }

  Widget sectionDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.primaryColor.withValues(alpha: .2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "or",
            style: AppFont.text14SemiBold.copyWith(
              color: AppColor.primaryColor.withValues(alpha: .7),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.primaryColor.withValues(alpha: .2),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }

  Widget sectionLoginSocialMedia() {
    return Column(
      children: [
        SocialMediaButton(
          color: AppColor.backgroundColor,
          title: "Continue with Facebook",
          icon: AppAssets.facebookIcon,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        SocialMediaButton(
          color: AppColor.backgroundColor,
          title: "Continue with Google",
          icon: AppAssets.googleIcon,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        Platform.isAndroid
            ? Container()
            : SocialMediaButton(
                color: AppColor.backgroundColor,
                title: "Continue with Apple",
                icon: AppAssets.appleIcon,
                onTap: () {},
              ),
      ],
    ).animate().fadeIn().scale(begin: const Offset(0, 1));
  }
}
