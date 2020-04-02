import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarNotification extends StatefulWidget {
  @override
  _AppBarNotificationState createState() => _AppBarNotificationState();
}

class _AppBarNotificationState extends State<AppBarNotification> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: true,
      position: BadgePosition(top: 5, right: -1),
      badgeContent: Text('10'),
      child: IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
    );
  }
}
