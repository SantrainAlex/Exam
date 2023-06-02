import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../modal/User.dart';

class UserModal extends ChangeNotifier{
  List<User> _user = [
    User(lastname: 'santrain', firstname: 'alexis', pseudo: 'alex', Avatar: 'aa', email: 'alex@alex.fr', DeeVee: 50, exploitation: '1')
  ];

  UnmodifiableListView<User> get users =>  UnmodifiableListView(_user);

  void add(User item) {
    _user.add(item);
    notifyListeners();
  }
  void subtractDeeVee(int price){
    _user[0].DeeVee = _user[0].DeeVee - price;
    print(_user[0].DeeVee);
  }


}