import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/components/show_dialog_app.dart';
import 'package:medsync/global/models/body/appointments_model.dart';
import 'package:medsync/global/models/body/reports_model.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/appointments/controller/appointments_controller.dart';
import 'package:medsync/modules/doctor/view/screen/doctor_appointment_screen.dart';
import 'package:medsync/modules/patient_history/controller/patient_history_controller.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}
class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:

    GetBuilder<AppointmentsController>(
        init: AppointmentsController(),
        builder: (con) {
      if (!con.loading) {
        return loadingAppWidget();
      }
      if (con.appointmentsModel!.bookingDates.isEmpty) {
        return Center(child: Text('You do not have any reports'.tr,style: TextStyle(
          color: ColorManager.secondBlue,fontSize: 16
        ),));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/top4.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                AppBarRowApp(isActivated: true,

                  text: 'Calendar'.tr,
                  icon: Icons.date_range_outlined,
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
            child: Text('Next appointments'.tr,style: TextStyle(
              color: ColorManager.black4,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 0,
            ),),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: con.appointmentsModel!.bookingDates.length,
              itemBuilder: (BuildContext context, int index) {
                var item = con.appointmentsModel!.bookingDates[index];
                return PrescriptionItem(bookingDate: item,

                );
              },
            ),
          ),
        ],
      );
    }),);
  }
}

class PrescriptionItem extends StatelessWidget {
  final BookingDate bookingDate;

  const PrescriptionItem({Key? key, required this.bookingDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: 387,
        height: 190,
        decoration: ShapeDecoration(
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: ColorManager.seventhBlue),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   width: 54,
                   height: 54,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: ColorManager.green,
                       width: 2
                     ),
                   color: ColorManager.white,

                   borderRadius: BorderRadius.circular(11),


                 ),

                 child: Center(child: Icon(Icons.check_box,color:  ColorManager.green,)),
                 ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(bookingDate.doctor.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                    color: ColorManager.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  )),
                              Text(
                                  "${bookingDate.bookingDate.day}-${bookingDate.bookingDate.month}-${bookingDate.bookingDate.year}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                    color: ColorManager.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icon_app.pharmacy_alt,
                                size: 50, color: ColorManager.firstBlue),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ButtonApp(
                circular: 10,
                onTap: () {


                  navigateTo(context,DoctorAppointmentScreen(idDoctor: bookingDate.doctor.id,));

                },
                text: 'details'.tr,
                width: MediaQuery.of(context).size.width,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
