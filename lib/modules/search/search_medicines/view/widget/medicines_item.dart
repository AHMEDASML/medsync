import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class MedicinesItem extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const MedicinesItem({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 4),
      child: ListTileTheme(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0),
        ),
        child: ListTile(
          tileColor: ColorManager.white,
          leading: const Icon(Icons.medication),
          trailing: const Icon(Icons.arrow_forward),
          title: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),
          onTap: onTap,
        ),
      ),
    );;
  }
}
