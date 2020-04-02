// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact implements Comparable<Contact> {
  String id;
  DateTime createdAt;
  String name;
  String avatar;
  String firstName;
  String lastName;
  String jobType;
  String phoneNumber;

  Contact({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
    this.firstName,
    this.lastName,
    this.jobType,
    this.phoneNumber,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        jobType: json["jobType"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "firstName": firstName,
        "lastName": lastName,
        "jobType": jobType,
        "phoneNumber": phoneNumber,
      };

  @override
  int compareTo(other) {
    return this.name.compareTo(other.name);
  }
}
