import 'package:flutter/material.dart';
import 'package:medsync/global/utils/Icon_app.dart';
import 'package:medsync/global/utils/color_app.dart';

class ItemHomePage extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData icon;
  final String urlImage;
  final double heightImage;
  final double widthImage;

  const ItemHomePage(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.icon,
      required this.urlImage,
      required this.heightImage,
      required this.widthImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: InkWell(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap ?? () {},
        child: Container(
          width: 144,
          height: 152,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            shadows: [
              BoxShadow(
                color: ColorManager.black2,
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Image.asset(
                urlImage,
                height: heightImage,
                width: widthImage,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorManager.gray2,
                          fontSize: 16,
                    height: 0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
