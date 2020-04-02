import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waverley_tools/bloc/contact_bloc.dart';
import 'package:waverley_tools/screens/Timeline/app_bar_notification.dart';
import 'package:waverley_tools/screens/contacts/contacat_search.dart';
import 'package:waverley_tools/screens/contacts/contact_list.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  static ContactBloc get contactBloc => ContactBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => contactBloc,
        child: Scaffold(
          key: key,
          appBar: buildAppbar(context),
          body: ContactList(),
        ));
  }

  buildAppbar(BuildContext context) {
    return AppBar(
      leading: AppBarNotification(),
      title: Text('Employee'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          alignment: Alignment.center,
          onPressed: () {
            showSearch(
              context: context,
              delegate: DataSearch(contactBloc),
            );
          },
        )
      ],
    );
  }
}
