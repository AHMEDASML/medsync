import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/calendar/view/widget/date_appointment.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/test5.jpg",
                    height: 70,
                    width: 70,
                    fit:
                        BoxFit.cover, // to make sure the image scales correctly
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TitleAppBold(
                          text: 'Dr.Alison Maer',
                          theme: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(width: 60),
                      Icon(Icons.arrow_forward_ios,
                          color: ColorManager.firstBlack, size: 24),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TitleAppBold(
                    text: 'West_yorkshire_clinic'.tr,
                    theme: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Row(
                  children: [
                    dateAppointment(
                        context: context,
                        text: '10 - May',
                        icon: Icons.calendar_today),
                    dateAppointment(
                        context: context,
                        text: '9:00 - 11:00',
                        icon: Icons.timer_outlined),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
