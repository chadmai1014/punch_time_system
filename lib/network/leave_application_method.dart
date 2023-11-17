import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:punch_clock_system/model/leave_note_model.dart';

class LeaveApplicationMethod with ChangeNotifier {
  List<LeaveNote> checklist = [];

  applyFor(
    String userID,
    int type,
    DateTime from,
    DateTime to,
  ) async {
    http.Response res = await http.post(
      Uri.parse('https://httpbin.org/post'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(
        {
          "userID": userID,
          "type": type,
          "fromDateTime": from.toString().substring(0, 19),
          "toDateTime": to.toString().substring(0, 19),
        },
      ),
    );
    if (res.statusCode == 200) {
      var cnt = jsonDecode(res.body) as Map<String, dynamic>;
      checklist.add(LeaveNote.fromJson(cnt['json']));
      notifyListeners();

      return "提交成功";
    } else {
      return "提交失敗，請重新送出";
    }
  }
}
