import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waverley_tools/models/contact.dart';
import 'package:waverley_tools/screens/contacts/contact_item.dart';

class ContactListContent extends StatefulWidget {
  final List<Contact> contacts;

  const ContactListContent({Key key, this.contacts}) : super(key: key);

  @override
  _ContactListContentState createState() => _ContactListContentState();
}

class _ContactListContentState extends State<ContactListContent> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
          child: ListView.builder(
              itemCount: widget.contacts.length,
              itemBuilder: (context, index) {
                return ContactItem(
                  contact: widget.contacts[index],
                  selected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = selectedIndex == index ? -1 : index;
                      // if (selectedIndex == index) {
                      //   setState(() {
                      //     selectedIndex = -1;
                      //   });
                      // } else {
                      //   setState(() {
                      //     selectedIndex = index;
                      //   });
                      //   // if (selectedIndex > -1) {
                      //   //   setState(() {
                      //   //     selectedIndex = -1;
                      //   //   });
                      //   //   Future.delayed(Duration(milliseconds: 100), () {
                      //   //     setState(() {
                      //   //       selectedIndex = index;
                      //   //     });
                      //   //   });
                      //   // } else {
                      //   //   setState(() {
                      //   //     selectedIndex = index;
                      //   //   });
                      //   // }
                      // }
                    });
                  },
                );
              })),
    );
  }
}
