import 'package:labaku/data/constant/app_string.dart';

import 'package:labaku/injection.dart';
import 'package:labaku/my_app.dart';
import 'package:labaku/utils/flavor.dart';
import 'package:labaku/utils/utilities.dart';
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
