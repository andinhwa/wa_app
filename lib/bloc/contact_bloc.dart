import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:waverley_tools/bloc/contact_repository.dart';
import 'package:waverley_tools/models/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository contactRepository = ContactRepository();
  ContactBloc();
  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  ContactState get initialState => ContactInitial();

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    try {
      yield* event.applyAsync(
          repository: contactRepository, currentState: state, bloc: this);
    } catch (_) {
      yield state;
    }
  }
}
