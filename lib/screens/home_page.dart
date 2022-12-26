import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:password_generator/screens/login/google-login_screen.dart';
import 'package:password_generator/screens/csv_gen.dart';
import 'package:password_generator/screens/location_page.dart';
import 'package:password_generator/screens/login/main_screen.dart';
import 'package:password_generator/screens/no_internet.dart';
import 'package:password_generator/screens/password_gen.dart';
import 'package:password_generator/utilities/google-sign_methods.dart';
import 'package:password_generator/widgets/widget_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? GoogleLoginPage()
        : Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? NoInternetScreen()
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Home Page"),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout_outlined),
                      tooltip: 'Logout',
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logOut().whenComplete(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoogleLoginPage()),
                          );
                        });
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.gif',
                        ),
                        UtilsWidgets.buildRoundBtn("Password Generator", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PasswordGenetator()),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        UtilsWidgets.buildRoundBtn("CSV Generator", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CsvGenerator()),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        UtilsWidgets.buildRoundBtn("Current Location", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationPage()),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        UtilsWidgets.buildRoundBtn("Screen Demo", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              );
  }
}
