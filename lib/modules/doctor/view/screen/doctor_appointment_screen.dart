import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/data/local/cache_helper.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/global/utils/key_shared.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  final String idDoctor;

  const DoctorAppointmentScreen({Key? key, required this.idDoctor})
      : super(key: key);

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  final cont = Get.put(DoctorController());
  var date = DateTime.now();




  final number=CacheHelper.getData(key: BookedNUMBER);
  @override
  void dispose() {
     cont.loading = false;
     cont.viewAllDoctorsModel = [];
     cont.specializationsModel=[];
     cont.allNumbersFlagModel = [];
     cont.nextNumberDrModel=null;
    super.dispose();
  }

  Future<void> _refreshData() async {
    await cont.getNextNumberDr(id: widget.idDoctor);
    setState(() {});
  }

  @override
  void initState() {
    cont.getNextNumberDr(id: widget.idDoctor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DoctorController>(
        init: DoctorController(),
        builder: (con) {
          if (!con.loading) {
            return loadingAppWidget();
          }

         else if (con.nextNumberDrModel == null) {
            return Center(
                child: Text("You don't have any appointments".tr,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 18.0,
                        color: ColorManager.secondBlue,
                        fontWeight: FontWeight.w600)));
          }
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [


                    Container(
                      height: 340,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/top1.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          AppBarRowApp(
                            text: 'calendar'.tr,
                            icon: Icons.calendar_month,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "${date.year} - ${date.day} - ${date.month}",
                              style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: ColorManager.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 0.08,
                              ),
                            ),
                          ),


                          SizedBox(height: 20),
                          Text('Doctor'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ColorManager.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    height: 0.05,
                                  )),
                          SizedBox(height: 30),
                          Text(con.nextNumberDrModel!.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ColorManager.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    height: 0.05,
                                  )),
                          SizedBox(height: 30),
                          Text(con.nextNumberDrModel!.specialization.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ColorManager.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 0.05,
                                  )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      height: 70,
                      child: Text(
                        'Your number is'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorManager.green,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                      ),
                    ),
                    Container(
                      width: 240,
                      height: 101,
                      decoration: ShapeDecoration(
                        color: ColorManager.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        textAlign: TextAlign.center,
                            number.toString(),
                        // "${con.nextNumberDrModel!.currentNumber}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorManager.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: 401,
                        height: 269,
                        decoration: ShapeDecoration(
                          color: ColorManager.white2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/mmm.png',
                              height: 222,
                              width: 180,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 123,
                                  height: 46,
                                  child: Text(
                                    'Next patient'.tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: ColorManager.seventhBlue,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 137,
                                  height: 65,
                                  decoration: ShapeDecoration(
                                    color: ColorManager.seventhBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      con.nextNumberDrModel!.nextNumber
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: ColorManager.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 150,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
