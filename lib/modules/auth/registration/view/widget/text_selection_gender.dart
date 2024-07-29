import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class TextSelectionGender extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TextSelectionGender({super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 42,
        decoration: BoxDecoration(

          color: isSelected ? ColorManager.seventhBlue : ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.black2,
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected ? Colors.white : ColorManager.seventhBlue,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}