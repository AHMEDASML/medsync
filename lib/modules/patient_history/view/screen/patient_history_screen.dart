import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/patient_history/view/widget/medical_report_item.dart';
import 'package:medsync/modules/patient_history/view/widget/prescription_item.dart';

class PatientHistoryScreen extends StatefulWidget {
  const PatientHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PatientHistoryScreen> createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen>
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 90,
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
                  const SizedBox(height: 30,),
                  AppBarRowApp(
                    isActivated: true,
                    text: 'history'.tr,
                    icon: Icons.date_range_outlined,
                  ),
                ],
              ),
            ),



            Image.asset(
              "assets/images/top5.png",
              height: 281,
              width: 306,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 371,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                child: Text(
                    'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        )),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            ButtonApp(
              text: 'Medical reports'.tr,
              onTap: () {
                navigateTo(context, const PrescriptionItemScreen());
              },
            ),
            const SizedBox(
              height: 30,
            ),

            ButtonApp(
              text: 'Prescriptions'.tr,
              onTap: () {
                navigateTo(context, const MedicalReportItemScreen());
              },
            ),

            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );
  }
}

// MedicalReportItemScreen(),
// PrescriptionItemScreen(),
