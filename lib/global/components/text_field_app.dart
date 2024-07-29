import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medsync/global/utils/color_app.dart';

class TextFieldApp extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldApp(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.textInputType,
      this.maxLines = 1,
      this.onChanged,
      this.controller,
      this.obscureText = false, this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Material(
          elevation: 2.0,
          shadowColor: ColorManager.firstBlack.withOpacity(0.4),
          child: TextField(

             inputFormatters: inputFormatters,
            obscureText: obscureText,
            controller: controller,
            // onChanged: onChanged,
            keyboardType: textInputType,
            maxLines: maxLines,
            cursorColor:ColorManager.fourthHeavenly,
            style: TextStyle(color: ColorManager.secondBlue, fontSize: 16),
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),  // Change to red
              ),
              suffixIconColor:ColorManager.fourthHeavenly,
              prefixIconColor: ColorManager.fourthHeavenly,
              filled: true,
              fillColor: Colors.transparent,
              hintText: hintText,
              hintStyle: TextStyle(color: ColorManager.gray1, fontSize: 16),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,


            ),
          ),
        ),
      ),
    );
  }
}

// ==============================================

class TextFieldOutlineApp extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;

  const TextFieldOutlineApp(
      {Key? key,
      required this.hintText,
        this.prefixIcon,
        this.suffixIcon,
      required this.textInputType,
      this.maxLines = 1,
      this.onChanged,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      // onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLines,
      style: TextStyle(color: ColorManager.secondBlue, fontSize: 16),
      decoration: InputDecoration(


        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(color: ColorManager.gray1, fontSize: 16,),
        prefixIcon: prefixIcon ?? SizedBox(height: 0),
        suffixIcon: suffixIcon?? SizedBox(height: 0),


      ),
    );
  }
}



class ShortTextFieldDateApp extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final int inputFormatters;

  const ShortTextFieldDateApp({Key? key, required this.hintText, required this.textInputType, this.controller, required this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(inputFormatters),
      ],
      textAlign: TextAlign.center,
      controller: controller,
      // onChanged: onChanged,
      keyboardType: textInputType,
      style: TextStyle(color: ColorManager.secondBlue, fontSize: 16),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        hintText: hintText,

        hintStyle: TextStyle(

          color: ColorManager.gray1, fontSize: 16,),
      ),
    );
  }
}
