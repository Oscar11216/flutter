// ignore_for_file: file_names, avoid_print

import 'dart:convert';

ReponseApi reponseApiFromJson(String str) =>
    ReponseApi.fromJson(json.decode(str));

String reponseApiToJson(ReponseApi data) => json.encode(data.toJson());

class ReponseApi {
  String message;
  String error;
  bool success;
  dynamic data;
  ReponseApi({
    this.message,
    this.error,
    this.success,
  });

  ReponseApi.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    error = json["error"];
    success = json["success"];
    try {
      data = json['data'];
    } catch (e) {
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": data,
      };
}
