// ignore_for_file: prefer_final_fields, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/api/environment.dart';
import 'package:flutter_application_1/src/models/responde_Api.dart';
import 'package:flutter_application_1/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  BuildContext context;

  // ignore: missing_return
  Future init(BuildContext context) {
    this.context = context;
  }

  Future<ReponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ReponseApi responseApi = ReponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('error $e');
      return null;
    }
  }

  Future<ReponseApi> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };

      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ReponseApi responseApi = ReponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}
