// ignore_for_file: unnecessary_new, prefer_final_fields, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/shared_pref.dart';

class ClientsProductsListController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) {
    this.context = context;
  }

  logout() {
    _sharedPref.logout(context);
  }
}
