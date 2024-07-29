import 'package:flutter/material.dart';
import 'package:medsync/global/utils/Icon_app.dart';

import '../../../../global/utils/color_app.dart';

class ItemCompetence extends StatelessWidget {
  final String text;
  final IconData icon;

  const ItemCompetence({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon,size: 38,color: ColorManager.secondBlue,),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(text,
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorManager.firstNavy,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
          ),
          // SizedBox(width: 20),
        ],
      ),
    );
  }
}
