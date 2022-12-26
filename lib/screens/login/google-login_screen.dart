import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:password_generator/screens/login/phone_login_screen.dart';
import 'package:password_generator/screens/home_page.dart';
import 'package:password_generator/screens/no_internet.dart';
import 'package:password_generator/utilities/google-sign_methods.dart';
import 'package:provider/provider.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({
    super.key,
  });

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  bool _isGoogleLogin = true;

  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) ==
            InternetConnectionStatus.disconnected
        ? NoInternetScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          _isGoogleLogin
                              ? Container(
                                  height: 50,
                                  width: 300,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.red,
                                    ),
                                    label: const Text('SignIn with Google'),
                                    onPressed: () {
                                      setState(() {
                                        _isGoogleLogin = false;
                                      });
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.googleLogin().whenComplete(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()),
                                        );
                                      });
                                      setState(() {
                                        _isGoogleLogin = true;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.mail,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : const CircularProgressIndicator(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.blue,
                              ),
                              label: const Text('SignIn with Phone'),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const PhoneLoginPage();
                                }));
                              },
                              icon: Icon(Icons.phone),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
