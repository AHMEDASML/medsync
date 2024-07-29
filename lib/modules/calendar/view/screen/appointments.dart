import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/calendar/view/widget/appointment_item.dart';
import 'package:medsync/modules/calendar/view/widget/date_appointment.dart';
import 'package:medsync/modules/calendar/view/widget/easy_date_line_app.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyDateLine(),
          TitleAppBold(
            text: 'Upcoming_Appointment'.tr,
            theme: Theme.of(context).textTheme.titleSmall,
          ),
          const AppointmentItem(),
          const AppointmentItem(),
          const AppointmentItem(),
          const AppointmentItem(),
          const AppointmentItem(),
        ],
      ),
    );
  }
}
