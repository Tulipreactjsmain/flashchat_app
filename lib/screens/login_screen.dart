// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flashchat_app/components/rounded_button.dart';
import 'package:flashchat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_app/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'loginScreen';

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  UserCredential? userCredential;
  @override
  void initState() {
    super.initState();
  }

  late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputStyles.copyWith(hintText: "Enter your email")),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: kInputStyles),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Login',
              onPressed: () async {
                try {
                  userCredential = await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  print('Error from isUser: $userCredential');
                  if (!context.mounted) return;
                  userCredential != null
                      ? Navigator.pushNamed(context, ChatScreen.id)
                      : "";
                } catch (e) {
                  print('Error from loginUser function: $e');
                }
              },
              color: kAirForceBlue,
            ),
          ],
        ),
      ),
    );
  }
}
