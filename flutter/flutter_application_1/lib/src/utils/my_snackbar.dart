// ignore_for_file: unnecessary_new, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';

class MySnackbar {
  static void show(BuildContext context, String text) {
    if (context == null) return;
    // ignore: unnecessary_new
    FocusScope.of(context).requestFocus(new FocusNode());

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 3),
    ));
  }
}
