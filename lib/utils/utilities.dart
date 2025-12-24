import 'package:labaku/utils/flavor.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static Future<FlavorConfig> flavorConfig() async {
    try {
      PackageInfo info = await PackageInfo.fromPlatform();
      final packageName = info.packageName;
      if (packageName.endsWith('dev')) {
        return FlavorConfig.dev();
      } else {
        return FlavorConfig.prod();
      }
    } catch (error) {
      logDebug('AppHelper # flavorConfig error $error');
    }
    return FlavorConfig.prod();
  }

  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static void logDebug(String? message) {
    if (isInDebugMode) {
      debugPrint(message, wrapWidth: 1024);
    }
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    //bahasa indonesia
    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 15) {
      return 'Selamat Siang';
    } else if (hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
