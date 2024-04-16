import 'package:flutter/foundation.dart';
import 'UserModel.dart';
import 'ApiService.dart';

class UserProvider with ChangeNotifier { //it is a change notifier class
  UserModel? _user;
  final ApiService _apiService = ApiService();

  UserModel? get user => _user;

  Future<void> fetchUser() async {
    _user = await _apiService.fetchRandomUser();
    notifyListeners();
  }
}
