import 'package:boilerplate/data/constant/app_assets.dart';
import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/injection.dart';
import 'package:boilerplate/presentation/onboarding/onboarding_screen.dart';
import 'package:boilerplate/presentation/splash_screen/bloc/splashscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
      splashscreenBloc
          .add(SplashScreenShowLogoAnimationEvent(isShowLogoAnimation: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: BlocConsumer<SplashscreenBloc, SplashscreenState>(
          bloc: splashscreenBloc,
          listenWhen: (state, previous) =>
              state.isShowLogoAnimation != previous.isShowLogoAnimation,
          listener: (context, state) {
            if (state.isShowLogoAnimation) {
              Future.delayed(const Duration(seconds: 4), () {
                if (mounted) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, Onboarding.routeName);
                }
              });
            }
          },
          builder: (context, state) {
            return state.isShowLogoAnimation
                ? Center(
                    child: LottieBuilder.asset(
                      AppAssets.logo,
                      height: 250,
                      repeat: false,
                    ),
                  )
                : Container();
          },
        ));
  }
}
