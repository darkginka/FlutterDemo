import 'package:flutter/material.dart';
import 'package:password_generator/screens/login/register_screen.dart';
import 'package:password_generator/widgets/widget_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key to maintain state like session..
  //
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Register')),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              SizedBox(
                width: 300,
                height: 400,
                child: LoginForm(
                  formKey: _formKey,
                  emailTextController: _emailTextController,
                  passwordTextController: _passwordTextController,
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
class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Sign In", style: Theme.of(context).textTheme.headline4),
            const Text("Login here"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please add email';
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
                  }
                },
                obscureText: true,
                controller: _passwordTextController,
                decoration: UtilsWidgets.buildInputDeoration(
                    'Enter password', 'Pass123@@', const Icon(Icons.lock)),
              ),
            ),
            const SizedBox(
              height: 20,
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
              child: const Text('Sigh In'),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   if (_emailTextController.text == 'admin' &&
                //       _passwordTextController.text == 'admin') {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const HomePage()));
                //   }
                // }
              },
            )
          ],
        ));
  }
}