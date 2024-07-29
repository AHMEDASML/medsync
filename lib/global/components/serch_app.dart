import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/search_medicines_screen.dart';

class SearchApp extends StatelessWidget {
  final bool textStatus;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  final FocusNode? focusNode;
  const SearchApp({super.key,  this.textStatus=true, required this.controller, this.onChanged, this.focusNode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,

      onTap: onTap ?? (){},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
             Expanded(
              child: TextField(
                focusNode: focusNode,
                enabled: textStatus,
                readOnly: !textStatus,
                decoration:   InputDecoration(
                  hintText: 'Enter_symptom'.tr,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
                controller: controller,
                // onChanged: onChanged,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: ColorManager.fourthBlue, size: 26),
              color: Colors.grey,
              splashRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}