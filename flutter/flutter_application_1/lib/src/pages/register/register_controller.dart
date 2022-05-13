// ignore_for_file: unnecessary_new, non_constant_identifier_names, missing_return, unused_local_variable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/responde_Api.dart';
import 'package:flutter_application_1/src/models/user.dart';
import 'package:flutter_application_1/src/provider/users_provider.dart';
import 'package:flutter_application_1/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController LastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ConfirmpasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  Future init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void regiter() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = LastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmacionpassword = ConfirmpasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmacionpassword.isEmpty) {
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if (confirmacionpassword != password) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(
          context, 'La contraseña debe tener la menos 6 caracteres');
      return;
    }

    User user = new User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);
    ReponseApi responseApi = await usersProvider.create(user);
    MySnackbar.show(context, responseApi.message);

    if (responseApi.success) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, 'login');
        return;
      });
    }

    print('RESPUESTA: ${responseApi.toJson()}');
  }

  void back() {
    Navigator.pop(context);
  }
}
