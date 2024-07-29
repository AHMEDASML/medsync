import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/themes/themes.dart';
import 'package:medsync/global/themes/themes_mode/dark.dart';
import 'package:medsync/global/themes/themes_mode/light.dart';
import 'package:medsync/global/utils/color_app.dart';

class ThemSelectionScreen extends StatefulWidget {
  const ThemSelectionScreen({Key? key}) : super(key: key);

  @override
  _ThemSelectionScreenState createState() => _ThemSelectionScreenState();
}

class _ThemSelectionScreenState extends State<ThemSelectionScreen> {
  String _selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Select_your_Themes'.tr,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              buildRadioListTile('Dark Mode', 'dark_mode'),
              const SizedBox(height: 20.0),
              buildRadioListTile('Light Mode', 'light_mode'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioListTile(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: ColorManager.fourthBlue, width: 2.0),
      ),
      child: RadioListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16.0),
        ),
        value: value,
        groupValue: _selectedLanguage,
        onChanged: (value) {
          setState(
            () {
              _selectedLanguage = value as String;
              if (Get.isDarkMode) {
                Get.changeTheme(Themes.customLightTheme);
              } else {
                Get.changeTheme(Themes.customDarkTheme);
              }
            },
          );
          print('Selected language: $_selectedLanguage');
        },
      ),
    );
  }
}
