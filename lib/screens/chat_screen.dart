// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flashchat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String id = "chatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                // getMessages();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: const Color.fromARGB(255, 104, 146, 166),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data?.docs;

                    List<Text> messageWidgtes = [];
                    for (var message in messages!) {
                      final messageText =
                          message.data() as Map<String, dynamic>;
                      final messageWidget = Text(
                        '${messageText['text']} from ${messageText['sender']}',
                        style: const TextStyle(color: Colors.black),
                      );
                      messageWidgtes.add(messageWidget);
                    }
                    return Column(
                      children: messageWidgtes,
                    );
                  } else {
                    // If snapshot does not have data, return a default widget or handle the case accordingly
                    return const CircularProgressIndicator();
                  }
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add(
                          {'text': messageText, 'sender': loggedInUser?.email});
                      // await printFirestoreCollections();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
