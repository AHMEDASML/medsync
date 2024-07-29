import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsync/global/components/appbar_simple.dart';
import 'package:medsync/global/utils/color_app.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _notices = [
    {
      "title": "Notice 1",
      "date": "July 1, 2023",
      "time": "10:00 AM",
      "read": false,
    },
    {
      "title": "Notice 2",
      "date": "July 2, 2023",
      "time": "2:30 PM",
      "read": true,
    },
    {
      "title": "Notice 3",
      "date": "July 3, 2023",
      "time": "9:15 AM",
      "read": false,
    },
    {
      "title": "Notice 4",
      "date": "July 4, 2023",
      "time": "11:45 AM",
      "read": true,
    },
    {
      "title": "Notice 5",
      "date": "July 5, 2023",
      "time": "3:00 PM",
      "read": false,
    },
  ];

  final Set<int> _newNoticeIndices = {0, 2, 4}; // Indices of new notices

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBarSimple(context: context,text: 'Notifications'.tr),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: _notices.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Card(
                // elevation: 6.0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: _notices[index]["read"] ? Colors.grey[300] : Colors.white,
                child: ListTile(
                  title: Text(
                    _notices[index]["title"],
                    style: _newNoticeIndices.contains(index)
                        ? Theme.of(context).textTheme.titleSmall
                        : null,
                  ),
                  subtitle: Text(
                    "${_notices[index]["date"]} • ${_notices[index]["time"]}",
                    style: TextStyle(

                      color: _notices[index]["read"] ? Colors.grey : ColorManager.fourthBlue,
                    ),
                  ),
                  trailing: _newNoticeIndices.contains(index)
                      ? Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlue,
                    ),
                  )
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}