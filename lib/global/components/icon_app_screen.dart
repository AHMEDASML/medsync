import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class IconAppScreen extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const IconAppScreen({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap?? (){},
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,

        child: CircleAvatar(
          backgroundColor: ColorManager.white,
          radius: 20,
          child: Icon(
              size: 20,
              icon,
              color: ColorManager.fourthBlue),
        ),
      ),
    );
  }
}
