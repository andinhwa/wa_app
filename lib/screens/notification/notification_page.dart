import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Notification'),
      centerTitle: true,
    );
  }
}
