import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/button_app.dart';
import 'package:medsync/global/models/body/prescriptions_model.dart';
import 'package:medsync/global/models/body/reports_model.dart';
import 'package:medsync/global/utils/color_app.dart';

class ShowDialogApp {
  void showDialogAppPrescription(
      {required BuildContext context,
      required PrescriptionsModel prescriptionsModel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          title: Column(
            children: [
              Text(
                prescriptionsModel.doctorInfo.name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.seventhBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
              Text(
                prescriptionsModel.doctorInfo.phone,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.grey4,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
              ),
              Text(
                "${prescriptionsModel.date.day}-${prescriptionsModel.date.month}-${prescriptionsModel.date.year}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'pharmaceutical'.tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.seventhBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                ),
              ),

              Column(
                  children: List.generate(prescriptionsModel.medications.length,
                      (index) {
                var item = prescriptionsModel.medications[index];
                return medicationIngredientPrescription(
                    context: context, item: item);
              })),

              // medicationIngredientPrescription(context: context),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'the_recipe'.tr,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.seventhBlue,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    prescriptionsModel.patientSituation,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget medicationIngredientPrescription(
      {required BuildContext context, required Medication item}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            // textAlign: TextAlign.start,
            "${item.name} : ${item.dosage} : ${item.type} ",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.grey5,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
          ),
          Icon(
            Icons.lightbulb_outline_sharp,
            color: ColorManager.seventhBlue,
            size: 24,
          )
        ],
      ),
    );
  }

  // =======
  void showDialogAppMedicalReports(
      {required ReportsModel reportsModel, required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          title: Column(
            children: [
              Text(
                reportsModel.doctorInfo.name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Color(0xFF299FF3),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                reportsModel.doctorInfo.phone,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.grey4,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
              ),
              Text(
                '${reportsModel.date.day} : ${reportsModel.date.month} : ${reportsModel.date.year}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
            ],
          ), // you can replace this with your desired title
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Recipe'.tr,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.seventhBlue,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    reportsModel.medicalReport,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                  ),
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
