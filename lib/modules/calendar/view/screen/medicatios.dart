import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/calendar/view/widget/easy_date_line_app.dart';

class MedicatiosScreen extends StatefulWidget {
  const MedicatiosScreen({Key? key}) : super(key: key);

  @override
  State<MedicatiosScreen> createState() => _MedicatiosScreenState();
}

class _MedicatiosScreenState extends State<MedicatiosScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

        const EasyDateLine(),
        TitleAppBold(
          text: 'My_medications'.tr,
          theme: Theme.of(context).textTheme.titleSmall,
        ),
        ChecMedications(),
        ChecMedications(),
        ChecMedications(),



        // CheckboxListTile(value: value, onChanged: onChanged)


      ],),
    );
  }
}





class ChecMedications extends StatefulWidget {
  @override
  _ChecMedicationsState createState() => _ChecMedicationsState();
}

class _ChecMedicationsState extends State<ChecMedications> {
  bool _valu = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      child: Center(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(
                'The_name_of_the_medication_you_want'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              subtitle:   Text(
                'The_name_of_the_medicine_or_the_thing_you_are_going_to_accomplish'.tr,
                style: TextStyle(color: Colors.black54),
              ),
              trailing: Transform.scale(
                scale: 1.5,
                child: Checkbox(


                  shape: CircleBorder(),
                  activeColor: ColorManager.secondBlue,
                  checkColor: Colors.white,
                  value: _valu,
                  onChanged: (bool? value) {
                    setState(() {
                      _valu = value!;
                    });
                  },
                ),
              ),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                radius: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
