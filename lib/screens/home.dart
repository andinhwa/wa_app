import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waverley_tools/screens/Timeline/timeline_page.dart';
import 'package:waverley_tools/screens/contacts/contact_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = [
    TimelinePage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigation(context),
    );
  }

  buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.timeline), title: Text('Timeline')),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.userFriends),
          title: Text('Employee'),
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).bottomAppBarColor,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
