import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/utils/color_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewMedsyncHome extends StatefulWidget {
  const PageViewMedsyncHome({Key? key}) : super(key: key);

  @override
  State<PageViewMedsyncHome> createState() => _PageViewMedsyncHomeState();
}

class _PageViewMedsyncHomeState extends State<PageViewMedsyncHome> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final pages = List.generate(
        6,
        (index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Text('How can you sterilize your hands ?'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorManager.secondBlue,
                                    fontSize: 22)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.tag_faces_sharp,
                                size: 40, color: ColorManager.secondBlue)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      maxLines: 6,overflow: TextOverflow.ellipsis,
                        'Clean your hands by rubbing them with an alcohol-based lotion; Alcohol is the preferred method for routinely disinfecting hands if they are not visibly dirty. It is also quicker, more effective, and is better tolerated by the hands than soap and water.',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              // color: ColorApp.white(context).withOpacity(0.6),
                              fontSize: 14,
                            )),
                  ),
                ],
              ),
            ));
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 12),
          Expanded(
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              type: WormType.thinUnderground,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
