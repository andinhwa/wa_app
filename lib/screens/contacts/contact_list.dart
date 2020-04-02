import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waverley_tools/bloc/contact_bloc.dart';
import 'package:waverley_tools/models/contact.dart';
import 'package:waverley_tools/screens/contacts/contact_list_content.dart';

class ContactList extends StatefulWidget {
  final List<Contact> contacts;

  const ContactList({Key key, this.contacts}) : super(key: key);
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    super.initState();
    loadContactData(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      alignment: Alignment.center,
      child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) => builContent(context, state)),
    );
  }

  builContent(BuildContext context, ContactState state) {
    if (state is ContactInitial || state is ContactLoading) {
      return buildLoding();
    } else if (state is ContactsLoaded) {
      return ContactListContent(
        contacts: state.contacts,
      );
    }
  }

  void loadContactData(BuildContext context) {
    BlocProvider.of<ContactBloc>(context)..add(GetContacts());
  }

  Widget buildLoding() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
