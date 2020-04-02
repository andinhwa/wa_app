import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waverley_tools/screens/Timeline/app_bar_notification.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      leading: AppBarNotification(),
      title: Text('Timeline'),
      centerTitle: true,
      actions: <Widget>[
        new PopupMenuButton(
          onSelected: popupMenuSelected,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem(
              child: const Text("child 0"),
              value: "Value 0",
            ),
            const PopupMenuItem(
              child: const Text("child 1"),
              value: "Value 1",
            ),
            const PopupMenuItem(
              child: const Text("child 2"),
              value: "Value 2",
            ),
          ],
        ),
      ],
    );
  }
}

void popupMenuSelected(String valueSelected) {}
