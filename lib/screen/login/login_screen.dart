import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 92, 179),
      body: Column(children: [
        Center(child: Image.asset('assets/tracardi_logo.png')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Server"),
                ),
              )),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Email"),
                ),
              )),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Password"),
                ),
              )),
        ),
      ]),
    );
  }
}
