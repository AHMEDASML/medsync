import 'package:flutter/material.dart';


class TitleAppBold extends StatelessWidget {
  final String text;
  final TextStyle? theme;

  const TitleAppBold({
    Key? key,
    required this.text,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: theme ??
          const TextStyle(color: Colors.indigo, fontSize: 1),
    );
  }
}
