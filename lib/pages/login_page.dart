import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:punch_clock_system/network/login_method.dart';
import 'package:punch_clock_system/pages/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _acctController = TextEditingController();
  final _pswdController = TextEditingController();
  late LoginMethod _loginMethod;

  @override
  void initState() {
    _loginMethod = Provider.of<LoginMethod>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _acctController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///假帳密
    _acctController.text = 'qwe';
    _pswdController.text = '123';
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 1300),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/light-1.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    width: 80,
                    height: 160,
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 1500),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/light-2.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 160,
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/clock.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 2100),
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: CupertinoColors.systemGrey6,
                                ),
                              ),
                            ),
                            child: CupertinoTextField.borderless(
                              controller: _acctController,
                              placeholder: "account",
                              placeholderStyle: const TextStyle(
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: CupertinoTextField.borderless(
                              obscureText: true,
                              controller: _pswdController,
                              placeholder: "password",
                              placeholderStyle: const TextStyle(
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),

                  ///call method
                  FadeInUp(
                    duration: const Duration(milliseconds: 2200),
                    child: CupertinoButton(
                      onPressed: login,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2300),
                    child: CupertinoButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void login() async {
    await _loginMethod.setUser(_acctController.text, _pswdController.text);
    if (mounted) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          settings: RouteSettings(name: '/index'),
          builder: (_) => RootPage(),
        ),
      );
    }
  }
}
