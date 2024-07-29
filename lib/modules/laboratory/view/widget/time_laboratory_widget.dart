import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class TimeLaboratoryWidget extends StatelessWidget {
  const TimeLaboratoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [

      Text('2 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(

          fontWeight: FontWeight.bold,
          color: ColorManager.secondBlue,
          fontSize: 14
      )),
      Text(' - ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(

          fontWeight: FontWeight.bold,
          color: ColorManager.secondBlue,
          fontSize: 14
      )),


      Text('16 PM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(

          fontWeight: FontWeight.bold,
          color: ColorManager.secondBlue,
          fontSize: 14
      )),


    ],);
  }
}
