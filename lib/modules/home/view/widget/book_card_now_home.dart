import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';

class BookCardNowHome extends StatelessWidget {
  const BookCardNowHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(


      child: Card(
        elevation: 2, // Sets the elevation of the card
        shape: RoundedRectangleBorder( // Sets the shape of the card
          borderRadius: BorderRadius.circular(10),
        ),
        color: ColorManager.fifthBlue, // Sets the background color of the card
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Adds padding to the contents of the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'), // Sets the image of the card
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Make an'.tr, style: Theme.of(context).textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Appointment'.tr, style: Theme.of(context).textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Easily'.tr, style: Theme.of(context).textTheme.displayMedium),
                      ),
                      // const SizedBox(height: 20),

                    ],
                  )
                ],
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: ColorManager.firstYellow, // Sets the background color of the button
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "I'm looking for your doctor now".tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.firstNavy, // Sets the text color of the button
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
