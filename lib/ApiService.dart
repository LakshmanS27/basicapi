import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UserModel.dart';

class ApiService { //class for API requests
  Future<UserModel> fetchRandomUser() async {
    final response = await http.get(Uri.parse("https://randomuser.me/api/"));
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return UserModel.fromJson(jsonMap);
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
