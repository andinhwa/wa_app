part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  Stream<ContactState> applyAsync(
      {ContactRepository repository,
      ContactState currentState,
      ContactBloc bloc});
}

class GetContacts extends ContactEvent {
  GetContacts();
  @override
  List<Object> get props => [];

  @override
  Stream<ContactState> applyAsync(
      {ContactRepository repository,
      ContactState currentState,
      ContactBloc bloc}) async* {
    try {
      yield ContactLoading();
      var contacts = await repository.loadAsync();
      yield ContactsLoaded(contacts);
    } catch (_) {
      yield ContactError(_?.toString());
    }
  }
}

class GetDetailedContact extends ContactEvent {
  final String contactId;

  GetDetailedContact(this.contactId);
  @override
  List<Object> get props => [contactId];

  @override
  Stream<ContactState> applyAsync(
      {ContactRepository repository,
      ContactState currentState,
      ContactBloc bloc}) async* {
    try {
      yield ContactLoading();
      var contact = await repository.getDetailedContact(contactId);
      yield ContactLoaded(contact);
    } catch (_) {
      yield ContactError(_?.toString());
    }
  }
}

class SearchContact extends ContactEvent {
  final String searchText;
  SearchContact(this.searchText);
  @override
  List<Object> get props => [];

  @override
  Stream<ContactState> applyAsync(
      {ContactRepository repository,
      ContactState currentState,
      ContactBloc bloc}) async* {
    try {
      yield ContactLoading();
      var contacts = await repository.searchAsync(searchText);
      yield ContactsLoaded(contacts);
    } catch (_) {
      yield ContactError(_?.toString());
    }
  }
}
