part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;

  ContactsLoaded(this.contacts);
  @override
  List<Object> get props => [contacts];
}

class ContactLoaded extends ContactState {
  final Contact contact;

  ContactLoaded(this.contact);
  @override
  List<Object> get props => [contact];
}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
  @override
  List<Object> get props => [message];
}
