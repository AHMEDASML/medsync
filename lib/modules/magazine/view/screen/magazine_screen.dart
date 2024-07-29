import 'package:flutter/material.dart';
import 'package:medsync/global/utils/color_app.dart';

class MagazineScreen extends StatefulWidget {
  const MagazineScreen({Key? key}) : super(key: key);

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Text(
        textAlign: TextAlign.center,
        'Page de magazine. Toujours en développement',style: Theme.of(context).
      textTheme.titleSmall!.copyWith(
          fontSize: 24.0,
          color: ColorManager.blue2,
          fontWeight: FontWeight.w500),),
    );
  }
}
