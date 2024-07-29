import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class AppBarRowApp extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool? isActivated;

  const AppBarRowApp({Key? key, required this.text, required this.icon, this.isActivated=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorManager.white, size: 30),
              SizedBox(
                width: 8,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
            ],
          ),
          isActivated==false ? GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.white,
              size: 30,
            ),
          ) : Container()
        ],
      ),
    );
  }
}

class AppBarRowImageApp extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Color? color;

  const AppBarRowImageApp(
      {Key? key, required this.text, required this.imageUrl, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageUrl,
                height: 45,
                width: 41,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: color ?? ColorManager.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(
              Icons.arrow_forward_ios,
              color: color ?? ColorManager.black,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
