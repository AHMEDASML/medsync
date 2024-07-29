import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';

class CardDoctorClinicApp extends StatelessWidget {
  const CardDoctorClinicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            SizedBox(
              height: 260,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/test5.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: ColorManager.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.favorite_border,
                                  color: ColorManager.firstRed),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  "Name".tr,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.firstBlack),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                  child: Icon(
                    Icons.map_sharp,
                    color: ColorManager.firstGray,
                  )),
            ),
            Center(
              child: Text(
                "Detailed_address".tr,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.firstGray),
              ),
            ),
          ],
        ),
      ),
    );
  }
}