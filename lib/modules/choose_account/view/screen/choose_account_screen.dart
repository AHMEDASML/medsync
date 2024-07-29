import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/components/button_outlined_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/auth/login/view/screen/login_screen.dart';
import 'package:medsync/modules/auth/registration/view/screen/registration_screen.dart';

class ChooseAccountScreen extends StatefulWidget {
  const ChooseAccountScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAccountScreen> createState() => _ChooseAccountScreenState();
}

class _ChooseAccountScreenState extends State<ChooseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              // Image.asset(
              //   "assets/images/choose-account-logo.png",
              //   width: 381,
              //   height: 260,
              // ),


              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Lottie.asset('assets/json_gif/patient_page.json',
                    width: 371,
                    height: 250,

                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Image.asset(
                "assets/images/medsync.png",
                width: 201,
                height: 68,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 371,

                  child: Text(
                    'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\n',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ButtonApp(
                text: 'sign in'.tr,
                onTap: () {
                  navigateTo(context, LoginScreen());
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,),
                child: ButtonOutlinedApp(
                    text: 'Create an account'.tr,
                    onTap: () {
                      navigateTo(context, RegistrationScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
