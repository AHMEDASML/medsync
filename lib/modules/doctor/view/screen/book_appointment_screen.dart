import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/models/body/view_all_doctors_model.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class BookAppointmentScreen extends StatefulWidget {
  final ViewAllDoctorsModel viewAllDoctorsModel;
  final String doctorId;

  const BookAppointmentScreen(
      {Key? key, required this.doctorId, required this.viewAllDoctorsModel})
      : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int? activeBoxIndex;
  var date = DateTime.now();
  final con = Get.find<DoctorController>();

  @override
  void initState() {
    con.getAllNumbersFlag(doctorId: widget.doctorId);
    super.initState();
  }


  Future<void> _refreshData() async {
    con.getAllNumbersFlag(doctorId: widget.doctorId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appbarNewApp(context: context, textTitle: 'Book Appointment'.tr),
        body: GetBuilder<DoctorController>(
      builder: (con) {
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/top2.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10,right: 10,top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.viewAllDoctorsModel.bookingEndTime,
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: ColorManager.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Closing time'.tr,
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: ColorManager.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 0.08,
                                      ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 30),
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
                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${widget.viewAllDoctorsModel.name} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: ColorManager.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          height: 0.05,
                                        ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ColorManager.white,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.viewAllDoctorsModel.specialization.name,
                                style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: ColorManager.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                        ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                !con.loading
                    ? loadingAppWidget()
                    : Column(
                        children: [
                          CloseIsOpen(
                            text: widget.viewAllDoctorsModel.isOpen == true
                                ? 'The doctor is available now'.tr
                                : "The doctor is not available now".tr,
                            color: widget.viewAllDoctorsModel.isOpen == true
                                ? ColorManager.green
                                : ColorManager.firstRed,
                          ),
                          Wrap(
                            children: List.generate(con.allNumbersFlagModel.length, (index) => _buildBox(
                              number: con.allNumbersFlagModel[index].number,
                              booked: con.allNumbersFlagModel[index].booked,
                            )),
                          ),
                        ],
                      ),


                SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: widget.viewAllDoctorsModel.isOpen==true? () {
                      if (activeBoxIndex != null
                          // && !_isBoxBooked(_activeBoxIndex!)
                          ) {
                        PanaraInfoDialog.show(
                          context,
                          buttonTextColor: ColorManager.white,
                          noImage: false,
                          textColor: ColorManager.secondBlue,
                          title: "Booking".tr,
                          message: "Do you want to confirm your reservation?".tr,
                          buttonText: "Okay".tr,
                          onTapDismiss: () {
                            con.bookExaminationDoctor(
                                doctorId: widget.doctorId,
                                bookedNumber: activeBoxIndex ?? -1,
                                context: context);
                            Navigator.of(context).pop();
                          },
                          panaraDialogType: PanaraDialogType.normal,
                          barrierDismissible: true,
                        );
                      }
                    }: null,
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: ShapeDecoration(
                        color:widget.viewAllDoctorsModel.isOpen==true ?ColorManager.seventhBlue:
                        ColorManager.grey2
                        ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      child: Center(
                        child: Text('Reservation confirmation'.tr,
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
        );
      },
    ));
  }

  Widget _buildBox({required int number, required bool booked}) {
    bool isActive = activeBoxIndex == number;
    bool canSelect = !booked;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 68,
        height: 68,
        child: GestureDetector(
          onTap: canSelect
              ? () {
                  setState(() {
                    activeBoxIndex = number;
                  });
                }
              : null,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive
                  ? ColorManager.green
                  : canSelect
                      ? ColorManager.white
                      : ColorManager.gray6,
              border: Border.all(
                color: isActive
                    ? ColorManager.green
                    : canSelect
                        ? ColorManager.seventhBlue
                        : ColorManager.gray6,
                width: 2.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$number',
                  style: TextStyle(
                    // color: Color(0xFF299FF3),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 0,

                    color: isActive
                        ? ColorManager.white
                        : canSelect
                            ? ColorManager.seventhBlue
                            : ColorManager.white,
                  ),
                ),

                // booked ?   Text(
                //   'booked up'.tr,
                //   style: TextStyle(
                //     fontSize: 10,
                //     fontWeight: FontWeight.w400,
                //     color: isActive ? Colors.white : canSelect ? Colors.black : Colors.red,
                //   ),
                // ):Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isBoxBooked(int index) {
    if (index >= 0 && index < con.allNumbersFlagModel.length) {
      return con.allNumbersFlagModel[index].booked;
    }
    return false;
  }
}

class CloseIsOpen extends StatelessWidget {
  final String text;
  final Color color;

  const CloseIsOpen({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.59,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
        child: Center(
          child: Text(text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                  )),
        ),
      ),
    );
  }
}
