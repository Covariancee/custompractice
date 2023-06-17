import 'package:flutter/material.dart';
import 'package:register/registerScreen.dart';

void main() {
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: const RegisterScreen()),
    );
  }
}
