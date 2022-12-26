import 'package:flutter/material.dart';
import 'package:password_generator/screens/shift_screens/home_screen.dart';
import 'package:password_generator/screens/shift_screens/list_screen.dart';
import 'package:password_generator/screens/shift_screens/sortable_table_screen.dart';
import 'package:password_generator/screens/shift_screens/start_screen.dart';
import 'package:password_generator/screens/shift_screens/tabbar_screen.dart';
import 'package:password_generator/screens/shift_screens/table_screen.dart';
import 'package:password_generator/widgets/widget_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainSreenState createState() => _MainSreenState();
}

class _MainSreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilsWidgets.buildAppBar('Monitor Screen'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UtilsWidgets.buildSqureBtn('Home', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }),
          const SizedBox(
            height: 40,
          ),
          UtilsWidgets.buildSqureBtn('Start', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StartPage()));
          }),
          const SizedBox(
            height: 40,
          ),
          UtilsWidgets.buildSqureBtn('List', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListPage()));
          }),
          const SizedBox(
            height: 40,
          ),
          UtilsWidgets.buildSqureBtn('Table', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TablePage()));
          }),
          const SizedBox(
            height: 40,
          ),
          UtilsWidgets.buildSqureBtn('TabBar', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TabPageScreen()));
          }),
          const SizedBox(
            height: 40,
          ),
          UtilsWidgets.buildSqureBtn('Sortable Table', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SortablePage()));
          }),
        ],
      ),
    );
  }
}
