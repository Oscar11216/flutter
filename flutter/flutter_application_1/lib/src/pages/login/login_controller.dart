// ignore_for_file: unnecessary_new, unused_local_variable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/responde_Api.dart';
import 'package:flutter_application_1/src/models/user.dart';
import 'package:flutter_application_1/src/provider/users_provider.dart';
import 'package:flutter_application_1/src/utils/my_snackbar.dart';
import 'package:flutter_application_1/src/utils/shared_pref.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController PasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();
  // ignore: missing_return
  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user?.sessionToken != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    }
  }

  // metodo
  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  // metodo que captura la informacion del usuario
  // ignore: duplicate_ignore
  void login() async {
    String email = emailController.text.trim();
    String password = PasswordController.text.trim();
    ReponseApi responseApi = await usersProvider.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    } else {
      MySnackbar.show(context, responseApi.message);
    }
  }
}
