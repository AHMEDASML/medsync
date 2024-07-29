import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/modules/settings/view/item_screen/languages_screen.dart';
import 'package:medsync/modules/settings/view/item_screen/them_screen.dart';

class SettingModel {
  final String title;
  final String route;
  final IconData icon;
  final Function()? onTap;

  SettingModel({
    this.onTap,
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<SettingModel> settings = [
  SettingModel(
    title: "Language".tr,
    route: "/",
    // icon: CupertinoIcons.person_fill,
    icon: Icons.translate,
    onTap: () {
      Get.to(LanguageSelectionScreen());
    },
  ),
  SettingModel(
    title: "Theme".tr,
    route: "/",
    icon: MdiIcons.brightness6,
    onTap: () {
      Get.to(ThemSelectionScreen());
    },
  ),
  SettingModel(
    title: "E-Statements".tr,
    route: "/",
    icon: CupertinoIcons.doc_fill,
    onTap: () {},
  ),
  SettingModel(
    title: "My Favorites".tr,
    route: "/",
    icon: CupertinoIcons.heart_fill,
    onTap: () {},
  ),
];

final List<SettingModel> settings2 = [
  SettingModel(
    title: "FAQ".tr,
    route: "/",
    icon: CupertinoIcons.ellipsis_vertical_circle_fill,
    onTap: () {},
  ),
  SettingModel(
    title: "Our Handbook".tr,
    route: "/",
    icon: CupertinoIcons.pencil_circle_fill,
    onTap: () {},
  ),
  SettingModel(
    title: "Community".tr,
    route: "/",
    icon: CupertinoIcons.person_3_fill,
    onTap: () {
      // push screen  ChatPage
      // navigateTo(context, ChatPage());
    },
  ),
];
