import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class AppBarRowArithmeticApp extends StatelessWidget {
  final String text;
  final String? titleName;
  final Widget icon;
  final void Function()? onTap;
  final bool isActivated;

  const AppBarRowArithmeticApp({Key? key, required this.text, required this.icon, this.onTap, this.titleName,   this.isActivated=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/top1.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: onTap,
                    child: icon),
                Row(children: [
                  text!=""? Icon(Icons.person,color: ColorManager.white,size: 26): Text(''),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],),


             isActivated==false?   GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },

                    child: Icon(Icons.arrow_forward_ios,color: ColorManager.white,size: 24,)): Container()
              ],



            ),

        SizedBox(height: 50,),
        Text(
          titleName ?? "" ,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 0.04,
          ),
        ),
          ],
        ),
      ),
    );
  }
}
