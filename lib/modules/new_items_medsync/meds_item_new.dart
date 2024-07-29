import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/map/view/map_screen.dart';

class MedsItemNew extends StatelessWidget {
  final Pharmacist pharmacist;
  final String state;
  final String side;

  const MedsItemNew(
      {Key? key,
      required this.pharmacist,
      required this.state,
      required this.side})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        width: 387,
        height: 200,
        decoration: ShapeDecoration(
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: ColorManager.seventhBlue),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Text(pharmacist.name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        )),
                Row(
                  children: [
                    Text(state,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            )),
                    Icon(
                      Icon_app.pharmacy,
                      color: ColorManager.blueEighth,
                      size: 36,
                    )
                  ],
                ),
                Text(side,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color(0xFF334146),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        )),
              ]),
              GestureDetector(
                onTap: (){
                  navigateTo(context,MapScreen(
                    lat:  longitude,
                    lot: latitude,
                    desLat: pharmacist.location.lng,
                    desLot: pharmacist.location.lat,
                    // desLat: 33.4914479,
                    // desLot: 36.3133119,
                  ));
                },
                child: Image.asset(
                  'assets/images/medicine-logo.png',
                  height: 76,
                  width: 69,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),

          ButtonApp(
              height: 50,
              text: 'Location'.tr,onTap: (){},circular: 10),
        ]),
      ),
    );
  }
}
