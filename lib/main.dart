import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:punch_clock_system/network/login_method.dart';
import 'package:punch_clock_system/network/record_time_method.dart';
import 'package:punch_clock_system/pages/login_page.dart';

import 'network/leave_application_method.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginMethod()),
        ChangeNotifierProvider(create: (_) => RecordTimeMethod()),
        ChangeNotifierProvider(create: (_) => LeaveApplicationMethod()),
      ],
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(fontSize: 22),
        )),
        home: LoginPage(),
      ),
    ),
  );
}
