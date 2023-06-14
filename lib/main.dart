import 'dart:async';
import 'dart:io';
import 'package:bk_bot/screens/lenguage_pages/lenguage_screen_controller.dart';
import 'package:bk_bot/screens/onboarding_pages/on_boarding_screen.dart';
import 'package:bk_bot/screens/splash_screen_pages/splash_screen.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import 'package:bk_bot/screens/home_pages/home_screen.dart';
import 'package:bk_bot/theme/app_theme.dart';
import 'package:bk_bot/theme/theme_services.dart';
import 'package:bk_bot/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:bk_bot/utils/lenguage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'google_ads_controller.dart';
import 'main_controller.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageScreenController());
    // Get.put(GoogleAdsController());
    Get.put(MainPageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalString(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: isLightMode == true && isDarkMode == true ? ThemeServices().theme : isDarkMode == true  ? ThemeMode.dark : isLightMode == true ? ThemeMode.light :   ThemeMode.dark ,
      home: const HomeScreen(),
    );
  }
}










