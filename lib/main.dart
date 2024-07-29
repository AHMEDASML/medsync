import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/data/remote/dio_helper.dart';
import 'package:medsync/global/localization/locale.dart';
import 'package:medsync/global/localization/locale_controller.dart';
import 'package:medsync/global/themes/themes.dart';

import 'package:medsync/global/utils/bindings_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/global/utils/size_app.dart';
import 'package:medsync/modules/auth/login/view/screen/login_screen.dart';
import 'package:medsync/modules/choose_account/view/screen/choose_account_screen.dart';


import 'package:medsync/modules/layout/view/layout_screen.dart';

import 'package:medsync/modules/splash/view/screen/splash_screen.dart';


String lang='en';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 50));
  SizeApp.screenSize =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // changeLang(codeLang: 'en');

    print('aaaaaaaaaaaa');
    print(CacheHelper.getData(key: TOKEN));
    lang= CacheHelper.getData(key: LANGUAGE) ?? 'en';
    return GetMaterialApp(
      locale: language(),
      translations: LocaleApp(),
      initialBinding: BindingsApp(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode:  ThemeMode.light,
      darkTheme: Themes.customDarkTheme,
      theme: Themes.customLightTheme,
      home: CacheHelper.getData(key: TOKEN) == null ? SplashScreen() : LayoutScreen(),
      //
      // home: MoreSpecializationsScreen(),
    );
  }
}
