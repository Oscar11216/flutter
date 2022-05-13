// ignore_for_file: unnecessary_new, prefer_final_fields, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/src/pages/client/products/list/client_products_list_controller.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key key}) : super(key: key);

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  ClientsProductsListController _con = new ClientsProductsListController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar session'),
        ),
      ),
    );
  }
}
