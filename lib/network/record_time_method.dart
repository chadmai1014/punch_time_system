import 'package:flutter/foundation.dart';

class RecordTimeMethod with ChangeNotifier {
  String onDuty = "------------";
  String offDuty = "------------";

  recordTime(bool punchIn) {
    String now = DateTime.now().toString();

    if (punchIn) {
      if (onDuty.length < 19) onDuty = now.substring(0, now.length - 7);
    } else {
      if (offDuty.length < 19) offDuty = now.substring(0, now.length - 7);
    }

    notifyListeners();
  }
}
