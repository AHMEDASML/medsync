import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/Common/functions_app.dart';
import 'package:medsync/global/components/icon_app_screen.dart';
import 'package:medsync/global/components/title_app_bold.dart';
import 'package:medsync/modules/home/view/widget/search_home.dart';
import 'package:medsync/modules/notifications/view/notifications_screen.dart';

class SearchAppScreen extends StatefulWidget {
  const SearchAppScreen({Key? key}) : super(key: key);

  @override
  State<SearchAppScreen> createState() => _SearchAppScreenState();
}

class _SearchAppScreenState extends State<SearchAppScreen> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleAppBold(
                  text: 'Find your specialist'.tr,
                  theme: Theme.of(context).textTheme.titleLarge,
                ),
                IconAppScreen(
                  onTap: () => navigateTo(context, const NotificationsScreen()),
                  icon: Icons.notifications_rounded,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchAppHome(controller: search, textStatus: true),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220, // height of the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // number of cards
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 20, // adjust as needed
                              backgroundImage: AssetImage(
                                  'assets/images/logo_app.png'), // replace with your image path
                            ),
                            const SizedBox(height: 20),
                            Text('Dr. Name $index'),
                            const SizedBox(height: 6),
                            Text('Specialty $index'),
                            const SizedBox(height: 6),
                            Text('Last vistit 2 weeks $index'),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // button's fill color
                                onPrimary: Colors.white, // button's text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Button'),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
