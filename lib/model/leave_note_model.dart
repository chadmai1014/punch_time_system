import 'dart:convert';

class LeaveNote {
  String? userID;
  int? type;
  String? fromDateTime;
  String? toDateTime;
  bool? isApproved = false;

  LeaveNote({
    this.userID,
    this.type,
    this.fromDateTime,
    this.toDateTime,
  });

  LeaveNote.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    type = json['type'];
    fromDateTime = json['fromDateTime'];
    toDateTime = json['toDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['type'] = type;
    data['fromDateTime'] = fromDateTime;
    data['toDateTime'] = toDateTime;
    data['isApproved'] = isApproved;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
