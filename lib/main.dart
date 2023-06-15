import 'package:flutter/material.dart';
import 'package:register/registerScreen.cart.dart';

void main() {
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: RegisterScreen()),
    );
  }
}
