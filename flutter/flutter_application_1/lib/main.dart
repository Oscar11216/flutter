// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/client/products/list/client_products_list_page.dart';
import 'package:flutter_application_1/src/pages/login/login_page.dart';
import 'package:flutter_application_1/src/pages/register/register_page.dart';
import 'package:flutter_application_1/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App Flutter',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => loginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'client/products/list': (BuildContext context) =>
            ClientProductsListPage(),
      },
      theme: ThemeData(
          // fontFamily: 'NimbusSans',
          primaryColor: MyColors.primaryColor),
    );
  }
}
