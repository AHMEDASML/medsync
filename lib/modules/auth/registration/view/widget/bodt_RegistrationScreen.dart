import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/components/logo_app_widget.dart';
import 'package:medsync/global/components/text_field_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/size_app.dart';
import 'package:medsync/global/utils/string_app.dart';
import 'package:medsync/modules/auth/controller/auth_controller.dart';
import 'package:medsync/modules/auth/registration/view/widget/text_selection_gender.dart';
import 'package:medsync/modules/auth/widget/account_text.dart';
import 'package:medsync/modules/auth/widget/button_auth.dart';
import 'package:medsync/modules/auth/widget/gender_dropdown_auth.dart';
import 'package:medsync/modules/profile/view/screen/edit_account_screen.dart';

class BodyRegistrationScreen extends StatefulWidget {
  const BodyRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<BodyRegistrationScreen> createState() => _BodyRegistrationScreenState();
}

class _BodyRegistrationScreenState extends State<BodyRegistrationScreen> {
  bool isPasswordVisible = false;
  bool isPasswordVisibleRet = false;
  String selectedGender = 'male';
  bool isAgreedToTnC = false;

  final con = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
        builder: (con) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: SizeApp.screenSize.height * 0.01,
            ),
            Center(
              child: Image.asset(
                "assets/images/medsync.png",
                height: 79,
                width: 208,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldApp(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*')),
              ],
              controller: con.firstName,
              hintText: 'Enter_first_name'.tr,
              prefixIcon: const Icon(Icons.person),
              suffixIcon: const SizedBox(),
              textInputType: TextInputType.text,
              onChanged: (String val) {
                con.firstName.text = val;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            TextFieldApp(
              hintText: 'Second name'.tr,
              prefixIcon: const Icon(Icons.person),
              suffixIcon: const SizedBox(),
              textInputType: TextInputType.text,
              controller: con.lastName,
              onChanged: (val) {
                con.lastName.text = val;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            TextFieldApp(
              hintText: 'Enter_the_email'.tr,
              prefixIcon: const Icon(Icons.email),
              suffixIcon: const SizedBox(),
              textInputType: TextInputType.text,
              controller: con.email,
              onChanged: (val) {
                con.email.text = val;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            TextFieldApp(
              hintText: 'mobile number'.tr,
              prefixIcon: const Icon(Icons.mobile_friendly),
              suffixIcon: CountryCodePicker(
                onChanged: (CountryCode? code) {
                  print('Selected country code: ${code?.dialCode}');
                  con.zIPCode = "${code?.dialCode}";
                },
                initialSelection: 'dz',
                favorite: const ['+213', 'DZ'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              textInputType: TextInputType.number,
              onChanged: (val) {
                con.phone.text = val;
              },
              controller: con.phone,
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textReg(text: 'gender'.tr, context: context),
                TextSelectionGender(
                  text: 'Male'.tr,
                  isSelected: selectedGender == 'male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'male';
                    });
                  },
                ),
                TextSelectionGender(
                  text: 'Female'.tr,
                  isSelected: selectedGender == 'female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'female';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            TextFieldApp(
              hintText: 'Enter_the_password'.tr,
              prefixIcon: const Icon(Icons.person),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              obscureText: !isPasswordVisible,
              textInputType: isPasswordVisible
                  ? TextInputType.text
                  : TextInputType.visiblePassword,
              onChanged: (val) {
                con.password.text = val;
              },
              controller: con.password,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldApp(

              inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(?:[0-4]?\d|60)$')),
              ],
              hintText: 'enter_the_age'.tr,
              prefixIcon: const Icon(Icons.abc_outlined),
              suffixIcon: const SizedBox(),
              textInputType: TextInputType.number,
              controller: con.age,
              onChanged: (val) {
                con.age.text = val;
              },
            ),

                CheckboxListTile(
                  title: RichText(
                    text:   TextSpan(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.gray2,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      children:   [
                        TextSpan(text: 'I agree to the'.tr),
                        TextSpan(
                            text: 'Terms and Conditions'.tr,
                        )],
                    ),
                  ),
                  value: isAgreedToTnC,
                  onChanged: (bool? value) {
                    setState(() {
                      isAgreedToTnC = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  // puts the checkbox at the start (leading/trailing for LTR/RTL langs)
                ),


            SizedBox(
              height: SizeApp.screenSize.height * 0.03,
            ),
            con.loading == false
                ? Center(
                    child: ButtonApp(
                      onTap: () {
                        if (isAgreedToTnC) {
                          con.registration(
                            context: context,
                            gender: selectedGender,
                          );
                        } else {

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Please agree to the Terms and Conditions'.tr)),
                          );
                        }
                      },
                      text: 'Registration'.tr,
                    ),
                  )
                : loadingAppWidget(),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      )),
    );
  }
}

Widget textReg({required String text, required BuildContext context}) {
  return SizedBox(
    width: 82,
    height: 30,
    child: Text(text,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorManager.gray2,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )),
  );
}
