import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/localization/locale_controller.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  Widget _buildRadioListTile(String title, String value) {
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
      ),
      child: GetBuilder<LocalController>(

        builder: (con) => RadioListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16.0),
          ),
          value: value,
          groupValue: con.selectedLanguage,
          onChanged: (value) {
            // setState(() {
              con.selectedLanguage = value ?? 'en';
              con.changeLang(codeLang: con.selectedLanguage);
            // });
            print('Selected language: ${con.selectedLanguage}');
          },
        ),
      ),
    );
  }

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
                'Select_your_language'.tr,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              _buildRadioListTile('English', 'en'),
              const SizedBox(height: 20.0),
              _buildRadioListTile('Arab', 'ar'),
              const SizedBox(height: 20.0),
              _buildRadioListTile('Français', 'fr'),
            ],
          ),
        ),
      ),
    );
  }
}
