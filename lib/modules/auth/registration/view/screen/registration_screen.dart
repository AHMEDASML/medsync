import 'package:flutter/material.dart';
import 'package:medsync/modules/auth/registration/view/widget/bodt_RegistrationScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyRegistrationScreen(),
    );
  }
}
