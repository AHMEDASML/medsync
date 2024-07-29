import 'package:flutter/material.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/icon_app_screen.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/models/body/search_models.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/map/view/map_screen.dart';

class SearchItem extends StatelessWidget {
  final double lat;
  final double lng;
  final Pharmacist pharmacist;
  final Function onTap;

  const SearchItem({
    Key? key,
    required this.pharmacist,
    required this.lat,
    required this.lng,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAppBold(
                text: pharmacist.name,
                theme: Theme.of(context).textTheme.bodyLarge,
              ),
              IconAppScreen(
                onTap: () {
                  navigateTo(
                      context,
                      MapScreen(
                        lot: lat,
                        lat: lng,
                        desLat: pharmacist.location.lat,
                        desLot: pharmacist.location.lng,
                      ));

                  onTap();
                },
                icon: Icons.map,
              ),
            ],
          ),
        ),
      ),
    );
  }
}