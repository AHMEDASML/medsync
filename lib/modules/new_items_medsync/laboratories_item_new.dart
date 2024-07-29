import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/models/body/laboratories_model.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/laboratories/view/screen/view_laboratories_details.dart';
import 'package:medsync/modules/map/view/map_screen.dart';
import 'package:medsync/modules/new_items_medsync/doctor_item_new.dart';

class LaboratoriesItemNew extends StatelessWidget {
  final LaboratoriesModel laboratoriesModel;

  final String state;
  final String side;

  const LaboratoriesItemNew(
      {Key? key,

        required this.state,
        required this.side, required this.laboratoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: ColorManager.gray6.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Colors.white38),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "assets/images/home11.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.fill,
                ),
              ),
              // GestureDetector(
              //   onTap: (){
              //     navigateTo(context,MapScreen(
              //       lat:  longitude,
              //       lot: latitude,
              //       desLat: laboratoriesModel.location.lng,
              //       desLot: laboratoriesModel.location.lat,
              //       // desLat: 33.4914479,
              //       // desLot: 36.3133119,
              //     ));
              //   },
              //   child: Image.asset(
              //     'assets/images/laboratory-logo.png',
              //     height: 76,
              //     width: 69,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Laboratori".tr + " ".tr + laboratoriesModel.name,
                          style:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),

                      Text(side,
                          style:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorManager.secondBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 0,
                          )),
                      // Row(
                      //   children: [
                      //     Text(state,
                      //         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      //           color: ColorManager.blue2,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w500,
                      //           height: 0,
                      //         )),
                      //     // Icon(
                      //     //   Icons.medical_services,
                      //     //   color: ColorManager.blueEighth,
                      //     // )
                      //   ],
                      // ),
                      Row(
                        children: [
                          Text('Algeria , Adrar',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                color: ColorManager.blue2,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              )),
                          // Icon(
                          //   Icons.medical_services,
                          //   color: ColorManager.blueEighth,
                          // )
                        ],
                      ),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                clinicOpen(text: 'Open lab'.tr, context: context),
                Expanded(
                  child:  ButtonApp(
                      height: 50,
                      fontSize: 16,
                      text: 'details'.tr,onTap: (){
                    navigateTo(context,ViewLaboratoriesDetails(laboratoriesModel: laboratoriesModel,));


                  },circular: 10),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
