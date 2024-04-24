import 'package:flutter/material.dart';
import 'package:flashchat_app/screens/welcome_screen.dart';
import 'package:flashchat_app/screens/login_screen.dart';
import 'package:flashchat_app/screens/registration_screen.dart';
import 'package:flashchat_app/screens/chat_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'welcomeScreen',
      routes: {
        'welcomeScreen': (context) => WelcomeScreen(),
        'loginScreen': (context) => LoginScreen(),
        'registrationScreen': (context) => RegistrationScreen(),
        'chatScreen': (context) => const ChatScreen()
      },
    );
  }
}
