import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginTextFieldController = TextEditingController();
    final passwordTextFieldController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.fastfood,
                color: Colors.amber,
                size: 160,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: loginTextFieldController,
                decoration: const InputDecoration(
                  hintText: 'Enter Username',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
