import 'package:boilerplate/data/constant/app_assets.dart';

class AppString {
  static String baseUrl = '';
  static const String appDev = 'dev';

  //error
  static const strNoRouteFound = "no_route_found";
  static const strAppName = "app_name";

  static const String strSuccess = "success";
  // error handler
  static const String strBadRequestError = "bad_request_error";
  static const String strNoContent = "no_content";
  static const String strForbiddenError = "forbidden_error";
  static const String strUnauthorizedError = "unauthorized_error";
  static const String strNotFoundError = "not_found_error";
  static const String strConflictError = "conflict_error";
  static const String strInternalServerError = "internal_server_error";
  static const String strUnknownError = "unknown_error";
  static const String strTimeoutError = "timeout_error";
  static const String strDefaultError = "default_error";
  static const String strCacheError = "cache_error";
  static const String strNoInternetError = "no_internet_error";

  static const List<Map<String, dynamic>> gridMenuItem = [
    {
      "icon": AppAssets.fashion,
      "title": "Fashion",
    },
    {
      "icon": AppAssets.electronics,
      "title": "Electronics",
    },
    {
      "icon": AppAssets.automotive,
      "title": "Automotive",
    },
    {
      "icon": AppAssets.homeAndLiving,
      "title": "Home & Living",
    },
    {
      "icon": AppAssets.groceries,
      "title": "Groceries",
    },
    {
      "icon": AppAssets.beautyAndCare,
      "title": "Beauty & Care",
    },
    {
      "icon": AppAssets.sports,
      "title": "Sports",
    },
    {
      "icon": AppAssets.others,
      "title": "Others",
    },
  ];
}
