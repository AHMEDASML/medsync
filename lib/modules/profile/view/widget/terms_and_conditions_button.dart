import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

Widget termsAndConditionsButton(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorManager.grey, // Your primary color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Terms & Conditions'),
              content: const SingleChildScrollView(
                child: Text('Your terms and conditions text goes here...'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Read Terms & Conditions',
          style: TextStyle(
            color: ColorManager.white, // Text color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
