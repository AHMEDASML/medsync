import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medsync/global/Common/loading_app.dart';
import 'package:medsync/global/components/appbar_new_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/states/controller/states_controller.dart';
import 'package:medsync/modules/states/view/widget/near_meItem.dart';
import 'package:medsync/modules/states/view/widget/states_item.dart';

class StatesScreen extends StatefulWidget {
  final String nameM;
  final String? idNameM;
  final String? title;
  final String? imageTitle;

  const StatesScreen(
      {Key? key,
      required this.nameM,
      this.idNameM,
      this.title,
      this.imageTitle})
      : super(key: key);

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNewApp(
          textTitle: 'State'.tr,
          context: context,
          actions: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(widget.title ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    widget.imageTitle ?? "",
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),

              ],
            ),
          )),
      body: GetBuilder<StatesController>(
        builder: (con) {
          if (!con.loading) {
            return loadingAppWidget();
          }
          return Column(
            children: [
              const NearMeItem(),
              Expanded(
                child: ListView.builder(
                  itemCount: con.statesModel.length,
                  itemBuilder: (context, index) {
                    return StatesItem(
                      nameMedicament: con.statesModel[index].name,
                      id: con.statesModel[index].id,
                      nameM: widget.nameM,
                      idNameM: widget.idNameM ?? '',
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


