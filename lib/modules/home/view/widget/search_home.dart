import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/search/search_medicines/view/screen/search_medicines_screen.dart';

class SearchAppHome extends StatefulWidget {
  final bool textStatus;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  final FocusNode? focusNode;
  const SearchAppHome({
    super.key,
    this.textStatus = true,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.onTap,
  });

  @override
  _SearchAppHomeState createState() => _SearchAppHomeState();
}

class _SearchAppHomeState extends State<SearchAppHome> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.onTap ?? () {},
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
                focusNode: widget.focusNode,
                enabled: widget.textStatus,
                readOnly: !widget.textStatus,
                decoration:   InputDecoration(
                  hintText: 'Enter keyword'.tr,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
                controller: widget.controller,
              ),
            ),
            DropdownButton<String>(
              items: [
                'Pharmacy',
                'Doctor',
                'Laboratory',
                'Medicine',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              value: _selectedOption,
              hint: Text(_selectedOption ?? 'Select'),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  color: ColorManager.fourthBlue, size: 26),
              color: Colors.grey,
              splashRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
