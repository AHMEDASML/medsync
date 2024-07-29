import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_one_app.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';


class ViewDrArea extends StatefulWidget {
  const ViewDrArea({Key? key}) : super(key: key);

  @override
  State<ViewDrArea> createState() => _ViewDrAreaState();
}

class _ViewDrAreaState extends State<ViewDrArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbarOneApp(context: context, title: 'View Dr Area'.tr, subTitle: 'View Dr'.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 40,),

            Text('Select the city'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(

                fontSize: 20.0,
                color: ColorManager.secondBlue,
                fontWeight: FontWeight.w600
            )),
            SizedBox(height: 10,),

            ViewDrAreaNearYouItem(),
            ViewDrAreaItem(),
            ViewDrAreaItem(),
            ViewDrAreaItem(),
            ViewDrAreaItem(),
            ViewDrAreaItem(),


          ]),
        ),
      ),
    );
  }
}

class ViewDrAreaItem extends StatelessWidget {
  const ViewDrAreaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [

          // Divider(
          //   height: 2.0,
          //   color: ColorManager.firstBlack,
          // ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(14),
              color: ColorManager.secondGray
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Damascus',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              )),

              GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded,color: ColorManager.secondBlue))

            ],
          ),),
        ],
      ),
    );
  }
}


class ViewDrAreaNearYouItem extends StatelessWidget {
  const ViewDrAreaNearYouItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [

          // Divider(
          //   height: 2.0,
          //   color: ColorManager.firstBlack,
          // ),
          SizedBox(height: 20,),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.green.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],

                borderRadius: BorderRadius.circular(14),
                color: ColorManager.green.withOpacity(0.2)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Near you'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  color: ColorManager.green
                )),
                Icon(Icons.gps_fixed,color: ColorManager.green,size: 24 ,)

              ],
            ),),
        ],
      ),
    );
  }
}


