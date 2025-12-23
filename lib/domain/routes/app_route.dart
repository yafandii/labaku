import 'package:boilerplate/injection.dart';
import 'package:boilerplate/presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:boilerplate/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:boilerplate/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:boilerplate/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:boilerplate/presentation/landing/landing_screen.dart';
import 'package:boilerplate/presentation/home.dart/bloc/home_bloc.dart';
import 'package:boilerplate/presentation/home.dart/home_screen.dart';
import 'package:boilerplate/presentation/onboarding/onboarding_screen.dart';
import 'package:boilerplate/presentation/splash_screen/bloc/splashscreen_bloc.dart';
import 'package:boilerplate/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SplashscreenBloc>(),
            child: const SplashScreen(),
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (_) => getIt<HomeBloc>(),
            child: const HomeScreen(),
          ),
        );
      case Onboarding.routeName:
        return MaterialPageRoute(
          builder: (_) => const Onboarding(),
        );
      case LandingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (_) => getIt<SignUpBloc>(), child: const SignUpScreen()),
        );
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignInBloc>(),
            child: const SignInScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}
