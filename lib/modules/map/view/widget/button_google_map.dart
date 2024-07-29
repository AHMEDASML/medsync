import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class ButtonGoogleMap extends StatelessWidget {
  final void Function()? onTap;
  const ButtonGoogleMap({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:   Icon(Icons.map,color: ColorManager.secondBlack,),
        ),
      ),
    );
  }
}