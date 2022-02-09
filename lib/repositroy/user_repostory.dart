import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_apaga/globals.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // ignore: missing_return
  Future loginUser(Map userMap) async {
    try {
      dynamic token = await FlutterSession().get('token');

      final response = await http.post(
        Uri.parse(api_url + '/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(userMap),
      );
      print(response.body);
      print('Status Code = ${response.statusCode}');
      var body = jsonDecode(response.body);
      var data = body['data'];
      if (body['status'] == 1) {
        String token = data['access_token'];
        await FlutterSession().set('token', token);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('login', true);
        print(body);
        return true;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> regiterUser(Map userMap) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(userMap),
      );

      var body = jsonDecode(response.body);

      var data = body['data'];
      // print(body);

      if (response.statusCode == 200) {
        String token = data['access_token'];
        await FlutterSession().set('token', token);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('register', token);
      }
    } catch (e) {
      print(e);
    }
  }
}
