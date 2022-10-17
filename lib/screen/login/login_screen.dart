import 'package:flutter/material.dart';

import '../../service/login_secure_storage_service.dart';

const Color _signInButtonColor = Color.fromARGB(255, 213, 164, 25);
const Color _tracardiBlueColor = Color.fromARGB(255, 4, 92, 179);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final serverController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final email = await LoginSecureStorage.getLoginEmail() ?? '';
    final password = await LoginSecureStorage.getLoginPassword() ?? '';
    final server = await LoginSecureStorage.getLoginServer() ?? '';

    setState(() {
      emailController.text = email;
      passwordController.text = password;
      serverController.text = server;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _tracardiBlueColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: _tracardiBlueColor,
        body: Column(children: [
          Center(child: Image.asset('assets/tracardi_logo.png')),
          serverField(),
          const SizedBox(height: 10.0),
          emailField(),
          const SizedBox(height: 10.0),
          passwordField(),
          const SizedBox(height: 40.0),
          signInButton()
        ]),
      )),
    );
  }

  Widget serverField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: serverController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "localhost:8686"),
              ),
            )),
      );

  Widget emailField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Email"),
              ),
            )),
      );

  Widget passwordField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Password"),
              ),
            )),
      );

  Widget signInButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              LoginSecureStorage.setLoginData(emailController.text,
                  passwordController.text, serverController.text);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: _signInButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Center(
                child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
          ),
        ),
      );
}
