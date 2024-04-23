import 'package:flutter/material.dart';
import 'package:flashchat_app/screens/welcome_screen.dart';
// import 'package:flashchat_app/screens/login_screen.dart';
// import 'package:flashchat_app/screens/registration_screen.dart';
// import 'package:flashchat_app/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}