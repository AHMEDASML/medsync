import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromWidget extends StatelessWidget {
  const FromWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('from'.tr,style: Theme.of(context).textTheme.bodyMedium!.copyWith(

              fontWeight: FontWeight.bold,
              fontSize: 20
          )),
          Text('a company'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(

            fontSize: 22,
            fontWeight: FontWeight.w600,
          )),
        ],
      ),
    );
  }
}
