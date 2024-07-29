import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/components/appbar_one_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/laboratory/view/widget/time_laboratory_widget.dart';



class ShowLaboratoryItemsScreen extends StatefulWidget {
  const ShowLaboratoryItemsScreen({Key? key}) : super(key: key);

  @override
  State<ShowLaboratoryItemsScreen> createState() => _ShowLaboratoryItemsScreenState();
}

class _ShowLaboratoryItemsScreenState extends State<ShowLaboratoryItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarOneApp(context: context, title: 'Laboratory'.tr, subTitle: ''),
      // appBar:  appbarNewApp(context: context,textTitle: 'Laboratory'),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ShowLaboratoryItemsCard(),
            ShowLaboratoryItemsCard(),
            ShowLaboratoryItemsCard(),
            ShowLaboratoryItemsCard(),
          ],
        ),
      ),
    );
  }
}



class ShowLaboratoryItemsCard extends StatelessWidget {
  const ShowLaboratoryItemsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,  // Change this
        shadowColor: ColorManager.secondBlue.withOpacity(0.2),

        child: Column(
          children: [

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buttonShowDoctorsItemsCardSmail(context: context),
                      SizedBox(height: 6,),

                      TimeLaboratoryWidget(),
                      Text('Name of informant'.tr,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.firstBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),

                      SizedBox(height: 4,),
                      Text('description'.tr,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.firstGray,
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                    ],
                  ),
                ),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.favorite,size: 22,color: ColorManager.secondBlue,),
                ),
              ],
            ),
            buttonShowDoctorsItemsCard(context: context),
          ],
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

Widget buttonShowDoctorsItemsCardSmail({required BuildContext context}){
  return  Container(
    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
    // margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),

    decoration: BoxDecoration(
        color: ColorManager.fourWhite, borderRadius: BorderRadius.circular(50)),
    child: Center(
      child: Row(
        children: [

          Icon(Icons.ac_unit_outlined,size: 20),
          SizedBox(width: 10,),
          Text('Proffesional Doctor'.tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: ColorManager.secondBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 12)),
        ],
      ),
    ),
  );
}
