import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/localization/locale_controller.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/main.dart';

class ChooseTheNewLanguage extends StatefulWidget {
  const ChooseTheNewLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseTheNewLanguage> createState() => _ChooseTheNewLanguageState();
}

class _ChooseTheNewLanguageState extends State<ChooseTheNewLanguage> {
  final cont = Get.put(LocalController());

  String selectedLanguage = 'English';

  void _onLanguageChanged(String? newValue) {
    setState(() {
      // cont.selectedLanguage = value ?? 'en';
      // changeLang(codeLang: cont.selectedLanguage);

      selectedLanguage = newValue!;
      print('Selected language: $selectedLanguage');

      if (selectedLanguage == 'English') {
        changeLang(codeLang: 'en');
        lang='en';
      } else if (selectedLanguage == "French") {
        changeLang(codeLang: 'fe');
        lang='fe';
      } else if (selectedLanguage == "Arabic") {

        changeLang(codeLang: 'ar');
        lang='ar';
      }
    });
  }

  @override
  void initState() {

   var tt= CacheHelper.getData(key: LANGUAGE);
   print('SDSDSDSDFDSDFS');
   print(tt);
    // selectedLanguage
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LocalController>(
        init: LocalController(),
        builder: (con){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueGrey[50],
          ),
          child: Row(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.language, color: ColorManager.firstBlue2)),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  underline: Divider(
                    height: 2,
                    color: ColorManager.black,
                  ),
                  onChanged: _onLanguageChanged,

                  style: TextStyle(
                    color: ColorManager.black,
                    fontSize: 18.0,
                  ),
                  // icon: Icon(Icons.arrow_drop_down),
                  items: <String>['Arabic', 'English', 'French']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.gray4,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          )),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });



  }
}
