import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:punch_clock_system/network/leave_application_method.dart';

const List<String> typeList = ["病假", "事假", "特休", "加班", "補打卡"];

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late LeaveApplicationMethod _leaveApplicationMethod;

  @override
  void initState() {
    _leaveApplicationMethod =
        Provider.of<LeaveApplicationMethod>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool haveContent = _leaveApplicationMethod.checklist.isEmpty;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(166, 193, 238, 1),
            Color.fromRGBO(251, 194, 235, 1)
          ],
        ),
      ),
      child: CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black.withOpacity(.1),
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: haveContent ? _getTextBody() : _getListBody(),
          )),
    );
  }

  Widget _getTextBody() {
    return Center(
      child: Text(
        "無審核中的假單",
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _getListBody() {
    return Consumer<LeaveApplicationMethod>(
      builder: (cxt, leaveApplicationMethod, child) {
        return ListView.builder(
          itemCount: leaveApplicationMethod.checklist.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(207, 217, 223, 1),
                  border: Border.all(
                    width: 3,
                    color: Color.fromRGBO(118, 127, 133, 1),
                  ),
                ),
                child: ChecklistItem(
                  isApproval:
                      leaveApplicationMethod.checklist[index].isApproved!,
                  type: leaveApplicationMethod.checklist[index].type!,
                  fromDateTime:
                      leaveApplicationMethod.checklist[index].fromDateTime!,
                  toDateTime:
                      leaveApplicationMethod.checklist[index].toDateTime!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ChecklistItem extends StatefulWidget {
  final bool isApproval;
  final int type;
  final String fromDateTime;
  final String toDateTime;

  const ChecklistItem({
    super.key,
    required this.isApproval,
    required this.type,
    required this.fromDateTime,
    required this.toDateTime,
  });

  @override
  State<ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: !widget.isApproval,
                child: Text(
                  "未",
                  style: TextStyle(
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ),
              Visibility(
                visible: widget.isApproval,
                child: Text(
                  "核",
                  style: TextStyle(
                    color: Color.fromRGBO(52, 138, 72, 1),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                typeList[widget.type - 1],
                style: TextStyle(
                  color: CupertinoColors.black.withOpacity(.8),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.fromDateTime.substring(0, 10),
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
              Visibility(
                visible: widget.type != 5,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    const Text(
                      "~",
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.toDateTime.substring(0, 10),
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
