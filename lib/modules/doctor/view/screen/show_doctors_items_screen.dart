import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_one_app.dart';
import 'package:medsync/global/models/body/view_all_doctors_model.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/controller/doctor_controller.dart';
import 'package:medsync/modules/doctor/view/screen/view_doctor_details.dart';
import 'package:medsync/modules/laboratory/view/widget/time_laboratory_widget.dart';

class ShowDoctorsItemsScreen extends StatefulWidget {
  final String id;
  final String? idMunicipalities;
  final String nameM;
  final String? idNameM;

  const ShowDoctorsItemsScreen(
      {Key? key,
      required this.id,
      this.idMunicipalities,
      required this.nameM,
      this.idNameM})
      : super(key: key);

  @override
  State<ShowDoctorsItemsScreen> createState() => _ShowDoctorsItemsScreenState();
}

class _ShowDoctorsItemsScreenState extends State<ShowDoctorsItemsScreen> {
  final cont = Get.put(DoctorController());

  @override
  void initState() {
    cont.getViewAllDoctors(
        name: 'wefwef',
        municipality: widget.idMunicipalities,
        specialization: widget.idNameM,
        state: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appbarOneApp(context: context, title: 'Show Doctors'.tr, subTitle: ''),
        body: GetBuilder<DoctorController>(
          builder: (con) {
            if (!con.loading) {
              return loadingAppWidget();
            }

            if (con.viewAllDoctorsModel.isEmpty) {
              return loadingAppWidget();
            }

            return ListView.builder(
              itemCount: con.viewAllDoctorsModel.length,
              itemBuilder: (context, index) {
                return ShowDoctorsItemsCard(
                  onTap: () {
                    navigateTo(
                        context,
                        ViewDoctorDetails(
                          viewAllDoctorsModel: con.viewAllDoctorsModel[index],
                        ));
                  },
                  viewAllDoctorsModel: con.viewAllDoctorsModel[index],
                );
              },
            );
          },
        ));
  }
}

class ShowDoctorsItemsCard extends StatelessWidget {
  final ViewAllDoctorsModel viewAllDoctorsModel;
  final void Function()? onTap;

  const ShowDoctorsItemsCard(
      {Key? key, required this.viewAllDoctorsModel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4, // Change this
          shadowColor: ColorManager.secondBlue.withOpacity(0.2),

          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/doctor_app.png'),
                        // Sets the image of the card
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buttonShowDoctorsItemsCardSmail(context: context),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(viewAllDoctorsModel.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: ColorManager.firstBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('description'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: ColorManager.firstGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.favorite,
                      size: 22,
                      color: ColorManager.secondBlue,
                    ),
                  ),
                ],
              ),
              buttonShowDoctorsItemsCard(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonShowDoctorsItemsCard({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: ColorManager.fourWhite, borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Text('Make Appointment'.tr,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorManager.secondBlue,
              fontWeight: FontWeight.w500,
              fontSize: 16)),
    ),
  );
}

Widget buttonShowDoctorsItemsCardSmail({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    // margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),

    decoration: BoxDecoration(
        color: ColorManager.fourWhite, borderRadius: BorderRadius.circular(50)),
    child: Center(
      child: Row(
        children: [
          const Icon(Icons.ac_unit_outlined, size: 20),
          const SizedBox(
            width: 10,
          ),
          Text('Professional Doctor'.tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: ColorManager.secondBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 12)),
        ],
      ),
    ),
  );
}
