

import 'package:flutter/widgets.dart';
import 'package:shieldy/resources/auth_method.dart';
import 'package:shieldy/model/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}