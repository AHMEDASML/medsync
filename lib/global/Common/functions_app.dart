import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/utils/key_shared.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

language() {
  Locale initialLang = CacheHelper.getData(key: LANGUAGE) == null
      // ? Get.deviceLocale!
      ? Locale('en')
      : Locale(CacheHelper.getData(key: LANGUAGE));
  return initialLang;
}
