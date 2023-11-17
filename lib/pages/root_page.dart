import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:punch_clock_system/pages/apply_list_page.dart';
import 'package:punch_clock_system/pages/checklist_page.dart';
import 'package:punch_clock_system/pages/time_punch_page.dart';
import 'package:punch_clock_system/pages/user_info_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Scaffold(
        bottomNavigationBar: getTabs(),
        body: getBody(),
      ),
    );
  }

  Widget getTabs() {
    List<IconData> iconList = [
      CupertinoIcons.rectangle_badge_checkmark,
      CupertinoIcons.calendar_badge_plus,
      CupertinoIcons.doc_checkmark,
      CupertinoIcons.person_fill,
    ];

    return AnimatedBottomNavigationBar(
        iconSize: 30,
        icons: iconList,
        activeColor: const Color.fromRGBO(143, 148, 251, .6),
        splashColor: const Color.fromRGBO(143, 148, 251, 1),
        inactiveColor: CupertinoColors.black.withOpacity(.5),
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        TimePunchPage(),
        ApplyListPage(),
        ChecklistPage(),
        UserInfoPage(),
      ],
    );
  }
}
