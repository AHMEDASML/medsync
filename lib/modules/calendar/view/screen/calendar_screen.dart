import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/appbar_app.dart';
import 'package:medsync/modules/calendar/view/screen/appointments.dart';
import 'package:medsync/modules/calendar/view/screen/medicatios.dart';
import 'package:medsync/modules/index/view/screen/index_screen.dart';
import 'package:medsync/modules/notifications/view/notifications_screen.dart';
import 'package:medsync/modules/profile/view/screen/edit_account_screen.dart';
import 'package:medsync/modules/settings/view/settings_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          AppbarApp(
              text: 'Calendar'.tr,
              firstIcon: Icons.view_array_outlined,
              onTapFirstIcon: () {},
              onTapSecondIcon: () {
                navigateTo(context, const NotificationsScreen());
              },
              secondIcon: Icons.notifications_rounded),
          const SizedBox(
            height: 30,
          ),
          TabBar(
            indicatorColor: Colors.transparent,
            controller: _tabController,
            tabs:   [
              Tab(
                child: TitleInbox(
                  text: 'Appointments'.tr,
                ),
              ),
              Tab(
                child: TitleInbox(
                  text: 'Medications'.tr,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: TabBarView(
              controller: _tabController,
              children: const [
                AppointmentsScreen(),
                MedicatiosScreen(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
