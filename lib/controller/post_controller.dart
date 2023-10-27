// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

bool returnValue = false;

Future<bool> createLogin(
    String username, String password, BuildContext context) async {
      
  print(username);
  print(password);

  var headers = {'Content-Type': 'application/json'};

  var request = http.Request(
      'POST', Uri.parse('http://15.206.68.154:5000/users/admin/login'));

  request.body = json.encode({"username": username, "password": password});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print( response.);

    returnValue = true;

    print("Success");
  } else {
    print(response.reasonPhrase);
    print('1');
  }
  return returnValue;

  
}
