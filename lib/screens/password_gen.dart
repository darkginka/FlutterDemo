import 'dart:math';
import 'package:flutter/material.dart';

class PasswordGenetator extends StatefulWidget {
  const PasswordGenetator({super.key});

  @override
  State<PasswordGenetator> createState() => _PasswordGenetatorState();
}

class _PasswordGenetatorState extends State<PasswordGenetator> {
  String _counter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Password"),
      ),
      body: Center(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your New Password is:',
            ),
            SelectableText(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(onPressed: _incrementCounter, icon: Icon(Icons.generating_tokens_outlined))
          ],
        ),
      ),
    );
  }
   void _incrementCounter() {
    setState(() {
      String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
      String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String _numbers = "0123456789";
      String _special = "@#=+!£\$%&?[](){}";
      String _allowedChars =  _lowerCaseLetters +_upperCaseLetters+_numbers+_special;
      int i = 0;
      String _result = "";

      while (i < 8) {
        int randomInt = Random.secure().nextInt(_allowedChars.length);
        _result += _allowedChars[randomInt];
        i++;
      }

      _counter = _result;
    });
  }
}