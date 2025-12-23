import 'package:boilerplate/data/constant/app_assets.dart';
import 'package:boilerplate/data/constant/app_env.dart';
import 'package:boilerplate/data/constant/app_string.dart';
import 'package:boilerplate/domain/routes/app_route.dart';
import 'package:boilerplate/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: AppEnvironment.env == AppString.appDev,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AppAssets.urbanist,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
