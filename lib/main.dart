import 'package:boilerplate/data/constant/app_string.dart';

import 'package:boilerplate/injection.dart';
import 'package:boilerplate/my_app.dart';
import 'package:boilerplate/utils/flavor.dart';
import 'package:boilerplate/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<FlavorConfig> _setupFlavor() async {
  final flavor = await AppUtils.flavorConfig();
  AppUtils.logDebug('Main # $flavor');
  AppString.baseUrl = flavor.baseUrl;

  //tambahkan api lain jika ada
  return flavor;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupFlavor();
  configureInjection('dev');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
