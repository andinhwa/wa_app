import 'package:waverley_tools/models/contact.dart';
import 'package:waverley_tools/services/contract_service.dart';

class ContactRepository {
  List<Contact> contacts = [];
  final ContacrService contacrService = FakeContacrService();

  static final ContactRepository contactRepository =
      ContactRepository._internal();
  ContactRepository._internal();

  factory ContactRepository() {
    return contactRepository;
  }
  bool onload = false;
  bool isLoaded = false;
  Future freshAsync() async {
    if (onload) {
      onload = false;
      return;
    }
    onload = true;
    contacts = await this.contacrService.getContacts();
    isLoaded = true;
  }

  Future<List<Contact>> loadAsync() async {
    if (!isLoaded) {
      await freshAsync();
    } else {
      freshAsync();
    }
    return this.contacts;
  }

  Future<List<Contact>> searchAsync(String query) async {
    if (isLoaded) {
      freshAsync();
      return this
          .contacts
          .where((ct) => ct.name.toLowerCase().contains(query))
          .toList();
    }
    return await this.contacrService.search(query);
  }

  Future<Contact> getDetailedContact(String id) {
    return this.contacrService.getDetailedContact(id);
  }
}
