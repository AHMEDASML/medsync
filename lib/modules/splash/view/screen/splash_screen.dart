// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/onboarding/view/onboarding_screen.dart';
import 'package:medsync/modules/splash/view/screen/select_language.dart';
import 'package:medsync/modules/splash/view/widget/from_widget.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/medsync_vid.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>
          const SelectLanguage(), // Replace with your next screen widget
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? Center(
                    child: SizedBox(
                      height: 155,
                      width: 342,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 329,
              height: 32,
              child: Text('Please wait for the download time'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      )),
            )
          ],
        ));
  }
}
