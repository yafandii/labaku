import 'package:labaku/injection.dart';
import 'package:labaku/presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:labaku/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:labaku/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:labaku/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:labaku/presentation/landing/landing_screen.dart';
import 'package:labaku/presentation/home.dart/bloc/home_bloc.dart';
import 'package:labaku/presentation/home.dart/home_screen.dart';
import 'package:labaku/presentation/onboarding/onboarding_screen.dart';
import 'package:labaku/presentation/splash_screen/bloc/splashscreen_bloc.dart';
import 'package:labaku/presentation/splash_screen/splash_screen.dart';
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
