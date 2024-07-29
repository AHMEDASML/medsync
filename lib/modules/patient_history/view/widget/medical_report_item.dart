import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/app_bar_new/app_bar_row_app.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/components/show_dialog_app.dart';
import 'package:medsync/global/models/body/prescriptions_model.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/patient_history/controller/patient_history_controller.dart';

class MedicalReportItemScreen extends StatefulWidget {
  const MedicalReportItemScreen({Key? key}) : super(key: key);

  @override
  State<MedicalReportItemScreen> createState() =>
      _MedicalReportItemScreenState();
}

class _MedicalReportItemScreenState extends State<MedicalReportItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: GetBuilder<PatientHistoryController>(builder: (con) {
        if (!con.loading) {
          return loadingAppWidget();
        }

        if (con.prescriptionsModel.isEmpty) {
          return Text('You do not have any prescriptions'.tr);
        }

        return Column(
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
                  AppBarRowApp(
                    text: 'prescription',
                    icon: Icons.date_range_outlined,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: con.prescriptionsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return MedicalReportItem(
                    prescriptionsModel: con.prescriptionsModel[index],
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}

// MedicalReportItem(),
class MedicalReportItem extends StatelessWidget {
  final PrescriptionsModel prescriptionsModel;

  const MedicalReportItem({Key? key, required this.prescriptionsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  child:  Image.asset(
                    'assets/images/hes1.png',
                    height:  52,
                    width: 52,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(prescriptionsModel.doctorInfo.name,
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
                              "${prescriptionsModel.date.day}-${prescriptionsModel.date.month}-${prescriptionsModel.date.year}",
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
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icon_app.wr6,
                            size: 50, color: ColorManager.firstBlue),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ButtonApp(
                circular: 10,
                onTap: () {
                  ShowDialogApp().showDialogAppPrescription(
                      context: context, prescriptionsModel: prescriptionsModel);
                },
                text: 'Details'.tr,
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
