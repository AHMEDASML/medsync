import 'package:flutter/material.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/components/button_outlined_app.dart';
import 'package:medsync/global/components/logo_app_widget.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/size_app.dart';
import 'package:medsync/modules/layout/view/layout_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeApp.screenSize.height * 0.2,
              ),
              const Align(alignment: Alignment.center, child: LogoAppWidget()),
              Center(
                child: Image.asset(
                  "assets/images/medsync.png",
                  height: 79,
                  width: 208,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Enter the OTP sent to your phone',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorManager.gray2,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                    inactiveFillColor: ColorManager.white,
                    inactiveColor: ColorManager.green,
                    shape: PinCodeFieldShape.circle,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),

                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: otpController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(height: 20),
              ButtonApp(
                  text: 'Verify OTP',
                  circular: 10,
                  width: 200,
                  height: 50,
                  onTap: () {
                    if (currentText == "000000") {
                      navigateAndFinish(context, LayoutScreen());
                    } else {
                      // Show an error message or retry OTP entry
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid OTP. Please try again.'),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
