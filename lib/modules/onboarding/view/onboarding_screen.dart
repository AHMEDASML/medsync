import 'package:flutter/material.dart';

import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/auth/login/view/screen/login_screen.dart';
import 'package:medsync/modules/layout/view/layout_screen.dart';
import 'package:medsync/modules/onboarding/data/pages.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.blue,
        buttonColor: ColorManager.firstBlack,
        activeBulletColor: ColorManager.firstTurquoise,

        // backgroundProvider: NetworkImage('https://picsum.photos/720/1280'),
        skipCallback: () {
          navigateAndFinish(context, LoginScreen());
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //   content: Text("Skip clicked"),
          // ));
        },
        finishCallback: () {
          navigateAndFinish(context, LoginScreen());
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //   content: Text("Finish clicked"),
          // ));
        },
      ),
    );
  }
}
