import 'package:flutter_svg/flutter_svg.dart';
import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/constant/app_color.dart';
import 'package:labaku/data/constant/app_font.dart';
import 'package:labaku/injection.dart';
import 'package:labaku/presentation/onboarding/onboarding_screen.dart';
import 'package:labaku/presentation/splash_screen/bloc/splashscreen_bloc.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashscreenBloc splashscreenBloc;

  @override
  void initState() {
    super.initState();
    splashscreenBloc = getIt<SplashscreenBloc>();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Onboarding.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Divider(
                  thickness: .5,
                  indent: MediaQuery.of(context).size.width / 4,
                  endIndent: MediaQuery.of(context).size.width / 4,
                  color: AppColor.primaryColor.withValues(alpha: .1),
                ),
                Text('Powered by Labaku Indonesia',
                    style: AppFont.text11Normal.copyWith(
                        color: AppColor.primaryColor.withValues(alpha: .3))),
                Text(
                  "Version 1.0.0",
                  style: AppFont.text10Normal.copyWith(
                    color: AppColor.primaryColor.withValues(alpha: .3),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset(
              AppAssets.logoFull,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
