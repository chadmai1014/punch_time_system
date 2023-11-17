import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:punch_clock_system/pages/apply_page.dart';

const List<String> entries = ["病假", "事假", "特休", "加班"];
const List<Color> colorCodes = [
  Color.fromRGBO(200, 162, 200, 1),
  Color.fromRGBO(153, 85, 187, 1),
];

class ApplyListPage extends StatefulWidget {
  const ApplyListPage({super.key});

  @override
  State<ApplyListPage> createState() => _ApplyListPage();
}

class _ApplyListPage extends State<ApplyListPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  settings: const RouteSettings(name: '/apply'),
                  builder: (_) =>
                      ApplyPage(title: "${entries[index]}申請", type: index + 1),
                ),
              );
            },
            pressedOpacity: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    colorCodes[index % 2],
                    colorCodes[index % 2].withOpacity(.6),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  entries[index],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black.withOpacity(.6),
                    letterSpacing: 20,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 10),
      ),
    );
  }
}
