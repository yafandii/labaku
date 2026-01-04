import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/constant/app_env.dart';
import 'package:labaku/data/constant/app_string.dart';
import 'package:labaku/domain/routes/app_route.dart';
import 'package:labaku/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'),
        Locale('en', 'US'),
      ],
      navigatorKey: appNavigatorKey,
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
