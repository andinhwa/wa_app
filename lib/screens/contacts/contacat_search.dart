import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waverley_tools/bloc/contact_bloc.dart';
import 'package:waverley_tools/models/contact.dart';
import 'package:waverley_tools/screens/contacts/contact_list_content.dart';

class DataSearch extends SearchDelegate {
  final Bloc<ContactEvent, ContactState> contactBloc;
  List<Contact> contacts = [];
  DataSearch(this.contactBloc);

  @override
  String get searchFieldLabel => 'Name, number...';

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    contactBloc.add(SearchContact(query));

    return BlocBuilder(
        bloc: contactBloc,
        builder: (BuildContext context, ContactState state) =>
            builContent(context, state));
  }

  builContent(BuildContext context, ContactState state) {
    if (state is ContactInitial || state is ContactLoading) {
      return buildLoding();
    } else if (state is ContactsLoaded) {
      contacts = state.contacts;
      return ContactListContent(
        contacts: state.contacts,
      );
    }
  }

  Widget buildLoding() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container();
    }
    contactBloc.add(SearchContact(query));

    return BlocBuilder(
        bloc: contactBloc,
        builder: (BuildContext context, ContactState state) =>
            builContent(context, state));
  }
}
