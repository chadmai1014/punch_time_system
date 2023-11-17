import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginMethod with ChangeNotifier {
  String? userID;
  String? password;

  setUser(String acct, String pswd) async {
    if (acct.isNotEmpty && pswd.isNotEmpty) {
      http.Response res = await http.post(
        Uri.parse('https://httpbin.org/post'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
          {
            "username": acct,
            "password": pswd,
          },
        ),
      );

      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body) as Map<String, dynamic>;
        userID = jsonResponse['json']["username"];
        password = jsonResponse['json']["password"];
      } else {
        debugPrint("Request failed with status code: ${res.statusCode}");
      }

      notifyListeners;
    }
  }
}
