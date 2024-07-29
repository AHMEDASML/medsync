import 'package:flutter/material.dart';
import 'package:medsync/modules/auth/login/view/widget/body_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BodyLogin()),
    );
  }
}
