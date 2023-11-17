import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:punch_clock_system/network/leave_application_method.dart';
import 'package:punch_clock_system/network/login_method.dart';

class ApplyPage extends StatefulWidget {
  final String title;
  final int type;

  ///type 1 sick leave
  ///type 2 personal leave
  ///type 3 paid leave
  ///type 4 overtime
  ///type 5 another day of time record

  const ApplyPage({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now();

  late LeaveApplicationMethod _leaveApplicationMethod;
  late LoginMethod _loginMethod;

  @override
  void initState() {
    _leaveApplicationMethod =
        Provider.of<LeaveApplicationMethod>(context, listen: false);
    _loginMethod = Provider.of<LoginMethod>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: getNavigationBar(),
      child: getBody(),
    );
  }

  ObstructingPreferredSizeWidget getNavigationBar() {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.systemPurple,
      leading: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          CupertinoIcons.back,
          color: CupertinoColors.white,
          size: 24,
        ),
      ),
      middle: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  Widget getBody() {
    bool isVisible = widget.type != 5;
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: CupertinoColors.systemYellow,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "From",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 15,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: <Color>[
                                      CupertinoColors.systemPink,
                                      CupertinoColors.systemYellow,
                                      CupertinoColors.systemPurple,
                                    ],
                                  ).createShader(const Rect.fromLTWH(
                                      0.0, 0.0, 180.0, 70.0)),
                              ),
                            ),
                          ),
                          const Text(
                            "日期",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                            ),
                          ),
                          CupertinoButton(
                            child: Text(
                              DateFormat('yyyy-MM-dd').format(startDateTime),
                              style: const TextStyle(
                                fontSize: 22,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () => _showDateTimeDialog(
                              initialDateTime: startDateTime,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => startDateTime = newDate);
                              },
                            ),
                          ),
                          const Text(
                            "時間",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                            ),
                          ),
                          CupertinoButton(
                            child: Text(
                              DateFormat('HH:mm').format(startDateTime),
                              style: const TextStyle(
                                fontSize: 22,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () => _showDateTimeDialog(
                              initialDateTime: startDateTime,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => startDateTime = newDate);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "To",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 15,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: <Color>[
                                      CupertinoColors.systemPink,
                                      CupertinoColors.systemYellow,
                                      CupertinoColors.systemPurple,
                                    ],
                                  ).createShader(const Rect.fromLTWH(
                                      0.0, 0.0, 220.0, 70.0)),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: const Text(
                              "日期",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: CupertinoButton(
                              child: Text(
                                DateFormat('yyyy-MM-dd').format(endDateTime),
                                style: const TextStyle(
                                  fontSize: 22,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: () => _showDateTimeDialog(
                                initialDateTime: endDateTime,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() => endDateTime = newDate);
                                },
                              ),
                            ),
                          ),
                          const Text(
                            "時間",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                            ),
                          ),
                          CupertinoButton(
                            child: Text(
                              DateFormat('HH:mm').format(endDateTime),
                              style: const TextStyle(
                                fontSize: 22,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () => _showDateTimeDialog(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: endDateTime,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => endDateTime = newDate);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          CupertinoButton(
            onPressed: () async {
              String msg = await _leaveApplicationMethod.applyFor(
                _loginMethod.userID!,
                widget.type,
                startDateTime,
                endDateTime,
              );
              _showNoticeDialog(msg);
            },
            child: Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: CupertinoColors.systemPurple,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 137, 68, 171),
                  width: 3,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.square_arrow_up,
                    color: CupertinoColors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "提交",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDateTimeDialog({
    required ValueChanged<DateTime> onDateTimeChanged,
    required DateTime initialDateTime,
    required CupertinoDatePickerMode mode,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 3,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialDateTime,
            mode: mode,
            use24hFormat: true,
            onDateTimeChanged: onDateTimeChanged,
          ),
        ),
      ),
    );
  }

  void _showNoticeDialog(String msg) async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(
          msg,
          style: const TextStyle(fontSize: 16),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              // 1.
              // Navigator.popUntil(
              //     context, (route) => route.settings.name == '/index');
              //
              // 2.
              Navigator.pop(context, 'ok');
            },
            child: const Text("OK"),
          ),
        ],
      ),
    ).then((value) {
      if (msg == '提交失敗，請重新送出') {
        return;
      }

      Navigator.pop(context);
    });
  }
}
