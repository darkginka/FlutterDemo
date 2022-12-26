import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Column(
          children: [
            Text(
              'Start',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            Container(
              width: 250.0,
              height: 250.0,
              color: Colors.red,
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.topLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
