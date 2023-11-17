import 'package:flutter/cupertino.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(51, 8, 103, 1),
            Color.fromRGBO(48, 207, 208, 1)
          ],
        ),
      ),
      child: CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 140, left: 70, right: 70, bottom: 200),
            child: _getBody(),
          )),
    );
  }

  Widget _getBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: CupertinoColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "姓名",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 28,
              ),
            ),
            Text(
              "staff001",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "出生",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 28,
              ),
            ),
            Text(
              "79-01-01",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "到職日",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 28,
              ),
            ),
            Text(
              "2023-06-22",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "員工信箱",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 28,
              ),
            ),
            Text(
              "123@tech.cc",
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
