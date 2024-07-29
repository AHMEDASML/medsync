import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/models/body/farmasy_model.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/farma/view/screen/view_farma_details.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/map/view/map_screen.dart';
import 'package:medsync/modules/new_items_medsync/doctor_item_new.dart';

class FarmaItemNew extends StatelessWidget {
  final FarmasyModel farmasyModel;
  final String state;
  final String side;

  const FarmaItemNew(
      {Key? key,
      required this.state,
      required this.side,
      required this.farmasyModel})
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

                  "assets/images/home2.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),


              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              //   child: GestureDetector(
              //     onTap: () {
              //
              //       navigateTo(
              //           context,
              //           MapScreen(
              //             lat: longitude,
              //             lot: latitude,
              //             desLat: farmasyModel.location.lng,
              //             desLot: farmasyModel.location.lat,
              //             // desLat: 33.4914479,
              //             // desLot: 36.3133119,
              //           ));
              //     },
              //       child: Icon(Icon_app.er5t,
              //           color: ColorManager.secondBlue, size: 28)),
              // ),

              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Pharmacist".tr + " ".tr + farmasyModel.name,
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
                clinicOpen(text: 'Pharmacy is open'.tr, context: context),
                Expanded(
                  child:   ButtonApp(
                      height: 50,
                      text: 'details'.tr,
                      fontSize: 16,
                      onTap: () {
                        navigateTo(
                            context,
                            ViewFarmaDetails(
                              farmasyModel: farmasyModel,
                            ));
                      },
                      circular: 10),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
