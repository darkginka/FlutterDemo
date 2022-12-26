import 'package:flutter/material.dart';
import 'package:password_generator/screens/login/login_screen.dart';
import 'package:password_generator/widgets/widget_utils.dart';

class RegisterPage extends StatelessWidget {
  final RegExp _regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _repasswordTextController =
      TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Login')),
          ),
          Column(
            children: [
              SizedBox(
                width: 300,
                height: 500,
                child: RegisterForm(
                  formKey: _formKey,
                  emailTextController: _emailTextController,
                  passwordTextController: _passwordTextController,
                  repasswordTextController: _repasswordTextController,
                  regex: _regex,
                ),
              ),
            ],
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.black12,
              )),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required regex,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    required TextEditingController repasswordTextController,
  })  : _formKey = formKey,
        _regex = regex,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _repasswordTextController = repasswordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final RegExp _regex;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController _repasswordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Sign Up", style: Theme.of(context).textTheme.headline4),
            const Text('Register here'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please add email';
                  } else {
                    if (!_regex.hasMatch(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  }
                },
                controller: _emailTextController,
                decoration: UtilsWidgets.buildInputDeoration('Enter email',
                    'john@me.co', const Icon(Icons.account_box_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password';
                  } else {
                    if (value.length <= 8) {
                      return 'Password length Should be gretter than 8';
                    }
                    return null;
                  }
                },
                obscureText: true,
                controller: _passwordTextController,
                decoration: UtilsWidgets.buildInputDeoration('Enter password',
                    'john@me.co', const Icon(Icons.lock_clock_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Reenter password';
                  } else {
                    if (_passwordTextController.text != value) {
                      return 'Password Should be same';
                    }
                    return null;
                  }
                },
                obscureText: true,
                controller: _repasswordTextController,
                decoration: UtilsWidgets.buildInputDeoration('Enter password',
                    'john@me.co', const Icon(Icons.lock_clock_rounded)),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.amber,
                  primary: Colors.black,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  )),
              child: const Text('Sigh Up'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text("Rohan")));
                }
              },
            )
          ],
        ));
  }
}

