import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/appointments/view/appointments_screen.dart';

import 'package:medsync/modules/home/view/home_screen.dart';
import 'package:medsync/modules/magazine/view/screen/magazine_screen.dart';

import 'package:medsync/modules/patient_history/view/screen/patient_history_screen.dart';
import 'package:medsync/modules/profile/view/screen/profile_screen.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AppointmentsScreen(),
    PatientHistoryScreen(),
    MagazineScreen(),
    ProfileScreen(),


    // AppointmentsScreen(),
    // HomeScreen(),
    // PatientHistoryScreen(),
    // SearchAppScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const MyNavigationBar({super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: currentIndex,
      selectedItemColor: ColorManager.green,
      unselectedItemColor: ColorManager.seventhBlue,
      onTap: onItemTapped,
      items:   [


        _buildNavigationBarItem('assets/images/accueil.png', 'Home'.tr),
        _buildNavigationBarItem(Icon_app.calendrier, 'calendar'.tr),
        _buildNavigationBarItem('assets/images/lhistoire2.png', 'history'.tr),
        _buildNavigationBarItem('assets/images/fichier2.png', 'the magazine'.tr),
        _buildNavigationBarItem(Icon_app.utilisateur, 'Profile'.tr),

      ],
    );
  }


  BottomNavigationBarItem _buildNavigationBarItem(dynamic icon, String label) {
    return BottomNavigationBarItem(
      icon: icon is String
          ? Image.asset(
        icon,
        height: 30,
        width: 30,
        fit: BoxFit.fill,
      )
          : Icon(
        icon,
        size: 30,
        color: ColorManager.blue2,
      ),
      label: label,
    );
  }
}


