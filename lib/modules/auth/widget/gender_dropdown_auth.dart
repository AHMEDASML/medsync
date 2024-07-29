import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/modules/auth/controller/auth_controller.dart';

class GenderDropdownAuth extends StatefulWidget {
  @override
  _GenderDropdownAuthState createState() => _GenderDropdownAuthState();
}

class _GenderDropdownAuthState extends State<GenderDropdownAuth> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (con){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton<String>(
            value: con.selectedGender,
            items: <String>['male', 'female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  con.selectedGender = newValue;
                });
                print('Selected Gender: ${con.selectedGender}');
              }
            },
          ),
        );
      },

    );
  }
}