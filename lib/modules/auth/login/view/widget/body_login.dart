import 'package:flutter/material.dart';
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
import 'package:medsync/modules/auth/widget/account_text.dart';
import 'package:medsync/modules/auth/widget/button_auth.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  bool isPasswordVisible = false;

  final con = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<AuthController>(
      builder: (con) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: SizeApp.screenSize.height * 0.03,
          ),
          const Align(alignment: Alignment.center, child: LogoAppWidget()),
          Image.asset(
            "assets/images/medsync.png",
            height: 79,
            width: 208,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: SizeApp.screenSize.height * 0.08,
          ),
          // TextFieldApp(
          //   hintText: 'Enter_the_phone'.tr,
          //   prefixIcon: const Icon(Icons.call),
          //   suffixIcon: const SizedBox(),
          //   textInputType: TextInputType.phone,
          //   onChanged: (val) {
          //     con.phone.text = val;
          //   },
          //   controller: con.phone,
          // ),

          TextFieldOutlineApp(
            hintText: 'mobile number'.tr,
            prefixIcon: Icon(Icons.call, color: ColorManager.fourthHeavenly),
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.phone,
            onChanged: (val) {
              con.phoneLogin.text = val;
            },
            controller: con.phoneLogin,
          ),
          const SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 20,
          ),

          TextFieldOutlineApp(
            hintText: 'Enter_the_password'.tr,
            prefixIcon:
                Icon(Icons.password, color: ColorManager.fourthHeavenly),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.fourthHeavenly),
            ),
            obscureText: !isPasswordVisible,
            textInputType: isPasswordVisible
                ? TextInputType.text
                : TextInputType.visiblePassword,
            onChanged: (val) {
              con.passwordLogin.text = val;
            },
            controller: con.passwordLogin,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TitleAppBold(
              text: "Forgot Password ?".tr,
              theme: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: SizeApp.screenSize.height * 0.12,
          ),
          con.loading == false
              ? ButtonApp(
                  onTap: () {
                    con.login(context);
                  },
                  text: 'Login'.tr,
                )
              : loadingAppWidget(),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    ));
  }
}
