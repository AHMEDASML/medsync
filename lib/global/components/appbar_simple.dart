 import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

 PreferredSizeWidget appBarSimple({context,String? text}) => AppBar(
   title: Text(text?? '',style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: ColorManager.white,
    );
