import 'dart:ui';

class User{
  final String lastname;
  final String firstname;
  final String pseudo;
  final String Avatar; // a changer en Image après la capture de photo
  final String email;
  late  int DeeVee;
  late String exploitation;

  User({
    required this.lastname,
    required this.firstname,
    required this.pseudo,
    required this.Avatar,
    required this.email,
    required this.DeeVee,
    required this.exploitation
  });
}