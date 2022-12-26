import 'package:flutter/material.dart';
import 'package:password_generator/screens/login/login_screen.dart';
class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Column(
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Make Coffee',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              '"Drink..Change..Yourself.."',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 50),
            TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.brown,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                icon: const Icon(Icons.login_rounded),
                label: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Login Here'),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
