import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:punch_clock_system/network/record_time_method.dart';
import 'package:punch_clock_system/pages/apply_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TimePunchPage extends StatefulWidget {
  const TimePunchPage({super.key});

  @override
  State<TimePunchPage> createState() => _TimePunchPageState();
}

class _TimePunchPageState extends State<TimePunchPage> {
  late RecordTimeMethod _recordTimeMethod;
  bool punchIn = true;

  @override
  void initState() {
    /// 3. 取得provider並開始獲取資料
    _recordTimeMethod = Provider.of<RecordTimeMethod>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 380,
            child: Stack(
              children: [
                Positioned(
                  top: -60,
                  height: 400,
                  width: w,
                  child: FadeInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/purple_background.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  height: 380,
                  width: w + 20,
                  child: FadeInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/purple_background-2.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: CupertinoColors.systemYellow,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "上班",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                      ),
                    ),
                    Consumer<RecordTimeMethod>(
                      builder: (cxt, recordTimeMethod, child) {
                        return Text(
                          recordTimeMethod.onDuty,
                          style: const TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        );
                      },
                    ),
                    const Text(
                      "下班",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                      ),
                    ),
                    Consumer<RecordTimeMethod>(
                      builder: (cxt, recordTimeMethod, child) {
                        return Text(
                          recordTimeMethod.offDuty,
                          style: const TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: ToggleSwitch(
                  minWidth: 120,
                  minHeight: 60,
                  initialLabelIndex: punchIn ? 0 : 1,
                  totalSwitches: 2,
                  activeBgColor: const [Color.fromRGBO(138, 43, 226, 1)],
                  inactiveBgColor: CupertinoColors.systemGrey2,
                  labels: const ["上班", "下班"],
                  fontSize: 18,
                  cornerRadius: 30,
                  onToggle: (index) {
                    debugPrint('toggle index: $index');
                    punchIn = index! == 0;
                  },
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            _recordTimeMethod.recordTime(punchIn);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            border: Border.all(
                              color: const Color.fromRGBO(196, 135, 198, .8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(135, 69, 133, .5),
                                blurRadius: 5,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "打卡",
                              style: TextStyle(
                                color: Color.fromRGBO(196, 135, 198, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              settings: const RouteSettings(name: '/apply'),
                              builder: (_) => const ApplyPage(
                                title: "補打卡申請",
                                type: 5,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            border: Border.all(
                              color: const Color.fromRGBO(255, 194, 67, .7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "補打卡",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 194, 67, .7),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
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
