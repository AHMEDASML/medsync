import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_arithmetic_app.dart';
import 'package:medsync/global/components/text_field_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/auth/widget/button_auth.dart';
import 'package:medsync/modules/profile/controller/profile_controller.dart';
import 'package:medsync/modules/profile/view/screen/profile_screen.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (con) {
                  if (!con.loading) {
                    return loadingAppWidget();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRowArithmeticApp(
                        titleName: con.profileModel!.data.firstName,
                        text: 'Arithmetic'.tr,
                        icon: con.loadingResponse == false
                            ? Column(
                                children: [
                                  Icon(Icons.edit,
                                      color: ColorManager.white, size: 26),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text('Edite'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontSize: 14,
                                                color: ColorManager.white)),
                                  )
                                ],
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: loadingAppWidget()),
                        onTap: con.editeProfile,
                      ),

                      textTitleProfileEdite(context: context, text: 'name'.tr),
                      TextFieldAppEdite(
                        hintText: 'Enter_the_new_name'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.text,
                        controller: con.firstName,
                        onChanged: (val) => con.firstName.text = val,
                      ),

                      textTitleProfileEdite(
                          context: context, text: 'last name'.tr),
                      TextFieldAppEdite(
                        hintText: 'Enter_the_new_last_name'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.text,
                        controller: con.lastName,
                        onChanged: (val) => con.lastName.text = val,
                      ),

                      const SizedBox(height: 15),
                      textTitleProfileEdite(context: context, text: 'Email'.tr),
                      TextFieldAppEdite(
                        hintText: 'Enter_the_new_email'.tr,
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.text,
                        controller: con.email,
                        onChanged: (val) => con.email.text = val,
                      ),

                      textTitleProfileEdite(context: context, text: 'Age'.tr),
                      TextFieldAppEdite(
                        hintText: 'Age adjustment'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.number,
                        controller: con.age,
                        onChanged: (val) => con.age.text = val,
                      ),
                      const SizedBox(height: 15),

                      textTitleProfileEdite(
                          context: context, text: 'medical History'.tr),
                      TextFieldAppEdite(
                        hintText: 'Medical History'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.number,
                        controller: con.medicalHistory,
                        onChanged: (val) => con.medicalHistory.text = val,
                      ),
                      const SizedBox(height: 15),

                      textTitleProfileEdite(
                          context: context, text: 'allergies'.tr),
                      TextFieldAppEdite(
                        hintText: 'allergies'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.number,
                        controller: con.allergies,
                        onChanged: (val) => con.allergies.text = val,
                      ),
                      const SizedBox(height: 15),

                      textTitleProfileEdite(
                          context: context, text: 'current medications'.tr),
                      TextFieldAppEdite(
                        hintText: 'current medications'.tr,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: SizedBox(),
                        textInputType: TextInputType.number,
                        controller: con.currentMedications,
                        onChanged: (val) => con.currentMedications.text = val,
                      ),

                      const SizedBox(height: 15),
                      textTitleProfileEdite(
                          context: context, text: 'Gender'.tr),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 65,
                          child: GenderDropdown()),
                      const SizedBox(height: 15),

                      // textTitleProfile(context: context,text: 'health information'),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 12),
                      //   child: TitleAppBold(
                      //     text: 'Edit_health_information'.tr,
                      //     theme: Theme.of(context)
                      //         .textTheme
                      //         .titleLarge!
                      //         .copyWith(fontSize: 18),
                      //   ),
                      // ),
                      // const SizedBox(height: 15),
                      // textTitleProfile(context: context,text: 'medical history'),
                      // _buildTextField(
                      //   controller: con.medicalHistory,
                      //   hintText:
                      //       'medical history'.tr,
                      //   prefixIcon: Icon(Icons.accessibility_new_sharp),
                      //   textInputType: TextInputType.number,
                      // ),

                      // textTitleProfile(context: context,text: 'allergies'),
                      // const SizedBox(height: 15),
                      // _buildTextField(
                      //   controller: con.allergies,
                      //   hintText:
                      //       'allergies'.tr,
                      //   prefixIcon: Icon(Icons.person),
                      //   textInputType: TextInputType.number,
                      // ),

                      // const SizedBox(height: 15),
                      // textTitleProfile(context: context,text: 'allergies'),
                      // _buildTextField(
                      //   controller: con.currentMedications,
                      //   hintText:
                      //   'current medications'.tr,
                      //   prefixIcon: Icon(Icons.person),
                      //   textInputType: TextInputType.number,
                      // ),

                      // textTitleProfile(context: context,text: 'Diseases'),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 12),
                      //   child: TitleAppBold(
                      //     text: 'Diseases'.tr,
                      //     theme: Theme.of(context)
                      //         .textTheme
                      //         .titleLarge!
                      //         .copyWith(fontSize: 18),
                      //   ),
                      // ),

                      // textTitleProfile(context: context,text: 'Diseases'),
                      // _buildTextField(
                      //   maxLines: 3,
                      //   hintText: 'diseases_that_you_suffer_from'.tr,
                      //   prefixIcon: Icon(Icons.person),
                      //   textInputType: TextInputType.text,
                      // ),
                      // const SizedBox(height: 15),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 12),
                      //   child: TitleAppBold(
                      //     text: 'Medical_life'.tr,
                      //     theme: Theme.of(context)
                      //         .textTheme
                      //         .titleLarge!
                      //         .copyWith(fontSize: 18),
                      //   ),
                      // ),
                      // _buildTextField(
                      //   maxLines: 3,
                      //   hintText:
                      //       "A glimpse into your medical life and the operations you undergone"
                      //           .tr,
                      //   prefixIcon: Icon(Icons.person),
                      //   textInputType: TextInputType.number,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 12),
                      //   child: TitleAppBold(
                      //     text: 'Pharmaceutical'.tr,
                      //     theme: Theme.of(context)
                      //         .textTheme
                      //         .titleLarge!
                      //         .copyWith(fontSize: 18),
                      //   ),
                      // ),
                      // _buildTextField(
                      //   maxLines: 3,
                      //   hintText:
                      //       'The names of the medicines you are taking now'
                      //           .tr,
                      //   prefixIcon: Icon(Icons.person),
                      //   textInputType: TextInputType.visiblePassword,
                      // ),
                      // const SizedBox(height: 30),
                      // con.loadingResponse == false
                      //     ? ButtonAuth(
                      //         titleButton: 'Edit_Account'.tr,
                      //         onTap: con.editeProfile,
                      //       )
                      //     : loadingAppWidget(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required Widget prefixIcon,
    required TextInputType textInputType,
    int? maxLines,
    TextEditingController? controller,
  }) {
    return TextFieldApp(
      controller: controller,
      maxLines: maxLines ?? 1,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: SizedBox(),
      textInputType: textInputType,
    );
  }
}

class GenderDropdown extends StatefulWidget {
  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (con) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton<String>(
            value: con.selectedGender,
            items: <String>['male', 'female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  con.selectedGender = newValue;
                });
                print('Selected Gender: ${con.selectedGender}');
              }
            },
          ),
        );
      },
    );
  }
}

Widget textTitleProfileEdite(
    {required BuildContext context, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ColorManager.seventhBlue,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
    ),
  );
}

class TextFieldAppEdite extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;

  const TextFieldAppEdite(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.textInputType,
      this.maxLines = 1,
      this.onChanged,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        // onChanged: onChanged,
        keyboardType: textInputType,
        maxLines: maxLines,
        style: TextStyle(color: ColorManager.secondBlue, fontSize: 16),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorManager.gray1,
            fontSize: 16,
          ),
          // prefixIcon: prefixIcon ?? SizedBox(height: 0),
          suffixIcon: suffixIcon ?? SizedBox(height: 0),
        ),
      ),
    );
  }
}
