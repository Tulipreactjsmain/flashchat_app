// ignore_for_file: library_private_types_in_public_api

import 'package:flashchat_app/constants.dart';
import 'package:flashchat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat_app/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registerScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  UserCredential? newUser;

  Future<void> registerUser() async {
    try {
      newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error from registerUser function: $e');
    }
  }

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
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
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
              title: 'Register',
              onPressed: () async {
                await registerUser();
                if (!context.mounted) return;
                newUser?.user != null
                    ? Navigator.pushNamed(context, ChatScreen.id)
                    : "";
              },
              color: kAirForceBlue,
            ),
          ],
        ),
      ),
    );
  }
}
