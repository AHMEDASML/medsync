import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_app.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:medsync/modules/home/controller/home_controller.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  final cont = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AppbarApp(
                text: 'Inbox'.tr,
                firstIcon: Icons.view_array_outlined,
                onTapFirstIcon: () {

                },
                onTapSecondIcon: () {

                },
                secondIcon: Icons.notifications_rounded),


            const SizedBox(height: 30,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:   [
                TitleInbox(text: 'Chats'.tr,),
                TitleInbox(text: 'Calls'.tr,),
              ],
            ),

            const SizedBox(height: 30,),

            Text('Doctor_online'.tr,style: Theme.of(context).textTheme.titleSmall),

            const SizedBox(height: 10,),


            SizedBox(
              height: 150,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                return   ProfilePictureImage(imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  name: 'name_Doctor'.tr,isActive: true);
              }, itemCount: 10, shrinkWrap: true),
            ),



            Text('Recent_chats'.tr,style: Theme.of(context).textTheme.titleSmall),
            const listTilwWidget(),
            const listTilwWidget(),
            const listTilwWidget(),
            const listTilwWidget(),
            const listTilwWidget(),
            const listTilwWidget(),

          ],


        ),
      ),
    );
  }


}

class TitleInbox extends StatelessWidget {
  final String text;
  const TitleInbox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1.0,
              blurRadius: 12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            TitleAppBold(
                text: text,
                theme: Theme.of(context).textTheme.bodyLarge
            ),

          ],
        ),
      ),
    );
  }
}

class ProfilePictureImage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isActive;

  const ProfilePictureImage({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[200],
                // backgroundImage: NetworkImage(imageUrl),
                backgroundImage: NetworkImage(imageUrl),
              ),
              if (isActive)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    // child: const Center(
                    //   child: Icon(
                    //     Icons.check,
                    //     color: Colors.white,
                    //     size: 12,
                    //   ),
                    // ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorOnlineWidget extends StatelessWidget {
  const DoctorOnlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // write a widget profilePictureImage with active icon  and name
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1.0,
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1.0,
                            blurRadius: 12,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 10,),
                    Text('Dr. John Doe',style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}



class listTilwWidget extends StatelessWidget {
  const listTilwWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // write a widget list tile with active icon  and name
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
        ),
        title: const Text('Dr. John Doe'),
        subtitle: Text('Hello_I_am_available'.tr),
        trailing: const Icon(Icons.check_circle,color: Colors.green,),
      ),
    );
  }
}

