import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_arithmetic_app.dart';
import 'package:medsync/global/models/body/view_all_doctors_model.dart';

import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/book_appointment_screen.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';
import 'package:medsync/modules/map/view/map_screen.dart';
import 'package:medsync/modules/new_items_medsync/shaqfa_map_item.dart';

class ViewDoctorDetails extends StatefulWidget {
  final ViewAllDoctorsModel viewAllDoctorsModel;

  const ViewDoctorDetails({Key? key, required this.viewAllDoctorsModel})
      : super(key: key);

  @override
  State<ViewDoctorDetails> createState() => _ViewDoctorDetailsState();
}

class _ViewDoctorDetailsState extends State<ViewDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarRowArithmeticApp(
                titleName: widget.viewAllDoctorsModel.name,
                text: '',
                icon: Icon(Icons.edit, color: ColorManager.white, size: 26),
                onTap: () {},
              ),



              Text(widget.viewAllDoctorsModel.specialization.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                    color: const Color(0xFF585858),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                      )),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: allIconDoctor(onTapMap: (){


                  navigateTo(
                      context,
                      MapScreen(
                        lat: longitude,
                        lot: latitude,
                        desLat: widget.viewAllDoctorsModel.location.lng,
                        desLot: widget.viewAllDoctorsModel.location.lat,
                        // desLat: 36.31763924030879,
                        // desLot: 33.51078292598665,


                        // desLat: 33.4914479,
                        // desLot: 36.3133119,
                      ));




                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bio".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: const Color(0xFF2CA6FF),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          )),


                      Text("Certificates and additional information that the doctor can add${widget.viewAllDoctorsModel.bio}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: const Color(0xFF585858),
                            fontSize: 18,

                            fontWeight: FontWeight.w500,
                            height: 0,
                          )),
                      Text("Address".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: const Color(0xFF2CA6FF),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          )),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                child: Text("District 1600, Residence, Building No. 112, Number One, Mail Article".tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      color: ColorManager.firstBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 200,width: 400,
                  child: ShaqfaMapItem(location: widget.viewAllDoctorsModel.location,),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: (){
                    navigateTo(
                      context,
                      BookAppointmentScreen(
                        doctorId: widget.viewAllDoctorsModel.id,
                        viewAllDoctorsModel: widget.viewAllDoctorsModel,
                      ),
                    );
                  },
                  child: Container(
                    width: 230,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: ColorManager.seventhBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                    ),
                    child: Center(
                      child: Text('book an appointment'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 0,

                      )),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




class ButtonBooking extends StatelessWidget {
  final String text;
  final void Function()? onTap;


  const ButtonBooking({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: ColorManager.secondBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: ColorManager.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget allIconDoctor({void Function()? onTapMap}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    iconDoctor(icon: Icons.map,onTap: onTapMap),
    iconDoctor(icon: Icons.chat),
    iconDoctor(icon: Icons.call),

  ],);
}

Widget iconDoctor({required IconData icon,void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.gray3.withOpacity(0.3)
        ),
        child: Icon(icon,color: ColorManager.black2.withOpacity(0.8),size: 24),),
    ),
  );
}
