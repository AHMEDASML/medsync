import 'package:flutter/material.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/doctor/view/screen/show_doctors_items_screen.dart';
import 'package:medsync/modules/laboratories/view/screen/laboratories_screen.dart';
import 'package:medsync/modules/municipalities_state/view/municipalities_state_screen.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/view_pharmacies.dart';

import '../../../farma/view/screen/farma_screen.dart';
import '../../../meds/view/screen/meds_screen.dart';

class StatesItem extends StatelessWidget {
  final String id;
  final String nameMedicament;
  final String? idMunicipalities;
  final String nameM;
  final String? idNameM;

  const StatesItem(
      {Key? key,
      required this.id,
      required this.nameMedicament,
      this.idMunicipalities,
      required this.nameM,
      this.idNameM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("====> ${nameM}");
        if (nameM == 'laboratories') {
          navigateTo(
              context,
              LaboratoriesScreen(
                idState: id,
              ));
        } else if (nameM == 'farma') {
          navigateTo(
              context,
              FarmaScreen(
                idState: id,
              ));
        } else if (idMunicipalities != null) {
          if (idNameM != '') {
            navigateTo(
                context,
                ShowDoctorsItemsScreen(
                  id: id,
                  nameM: nameM,
                  idNameM: idNameM,
                  idMunicipalities: idMunicipalities,
                ));
          } else {
            navigateTo(
                context,
                ViewPharmacies(
                  state: id,
                  nameMedicament: nameMedicament,
                  municipality: idMunicipalities ?? '',
                  nameM: nameM,
                ));
          }
        } else {
          navigateTo(
              context,
              MunicipalitiesStateScreen(
                idState: id,
                idNameM: idNameM,
                nameM: nameM,
              ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(nameMedicament,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorManager.gray2,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            )),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: ColorManager.seventhBlue,
                    size: 45,
                  )
                ],
              ),
            ),
            Container(
              width: 339,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: ColorManager.gray3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
