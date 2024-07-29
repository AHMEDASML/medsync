import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/components/serch_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/widget/card_doctor_app.dart';
import 'package:medsync/modules/doctor/view/widget/card_doctor_clinic_app.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {

  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple(context: context, text: 'Doctor'.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                child: SearchApp(textStatus: true, controller: search,),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child:
                    Text('doctors'.tr, style: Theme.of(context).textTheme.bodyLarge),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardDoctorApp(),
                    CardDoctorApp(),
                    CardDoctorApp(),
                    CardDoctorApp(),
                    CardDoctorApp(),
                    CardDoctorApp(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child: Text('popular_clinic'.tr,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              SizedBox(
                height: 400,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardDoctorClinicApp(),
                    CardDoctorClinicApp(),
                    CardDoctorClinicApp(),
                    CardDoctorClinicApp(),
                    CardDoctorClinicApp(),
                    CardDoctorClinicApp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


