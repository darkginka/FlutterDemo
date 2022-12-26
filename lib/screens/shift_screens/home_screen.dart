import 'package:flutter/material.dart';
import 'package:password_generator/widgets/widget_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Page'),
          actions: [
            TextButton.icon(
                onPressed: () {},
                icon: const CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/31396751?s=400&u=b0de4f4adbe7ba393509f9a46c3ddf83ff7ad36e&v=4'),
                ),
                label: const Text(
                  //'$_counter',
                  'Rohan',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(),
        ),
        bottomNavigationBar: UtilsWidgets.bottomBar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
