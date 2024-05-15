import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: kAirForceBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: Colors.black54
  )
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kAirForceBlue, width: 2.0),
  ),
);

const Color kFrenchGrey = Color.fromARGB(255, 140, 148, 162);
const Color kAirForceBlue = Color(0xff4E8098);

const InputDecoration kInputStyles = InputDecoration(
  hintText: 'Enter your password.',
  hintStyle: TextStyle(color: kAirForceBlue),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAirForceBlue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAirForceBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
