import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class EasyDateLine extends StatelessWidget {
  const EasyDateLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 30,top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //[selectedDate] the new date selected.
            },
            activeColor: ColorManager.thirdBlack,
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayNumDayStr,
              inactiveBorderRadius: 48.0,
              height: 56.0,
              width: 56.0,
              activeDayNumStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              inactiveDayNumStyle: TextStyle(
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
