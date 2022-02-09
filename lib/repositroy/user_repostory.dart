import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_apaga/globals.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // ignore: missing_return
  Future loginUser(Map userMap) async {
    try {
      //  dynamic token = await FlutterSession().get('token');
      dynamic token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWE5ZmNmYTFjMDUzZDMxNDhlM2IyZGM5YjYwMGI3ODYwMDQ2MDRmNjViZjUzNWY4NTk0MGU3NmFiNDBiMDg4MWQ0OWMxYmY2NTQxMzM2NDciLCJpYXQiOjE2NDQ0NDI0ODAsIm5iZiI6MTY0NDQ0MjQ4MCwiZXhwIjoxNjc1OTc4NDgwLCJzdWIiOiI4MSIsInNjb3BlcyI6W119.uoVaA2A-j1_KbxrB502WhIG2IHWMLhuHoMW35EIymQkzhtoLWOgOe94hE3BlKK4hlib_istAM_4Kq0UDMKea8zlXIrz4eGyNucDQOxdGO4mS_mq1v1SmnbVcTqsRb5nANXn2w5ufwCI9QSV_b4APWeOLrabbWq3lEPS_ABFo9wDIJ6nXY_9Se991LNIZo6QtXss221d5ilwRSMMRyuedZHqUaD6Nyu-L1cc8yhLwT3_a1rFbvnid53yErtwlXB2G6uHQH0jt3_lYeoCei77rUiSkY8U5vG3-a4QsO23rSzatMzOKtGa6R6YaRXWHjoSk224N4ASpjt87b3VWe7bCm4Y36ZvC1s9yczsvza6iHtIIAd4VGNkn5n1xh-pFm2F81iBCSRlC3EuNPxjF3Jsi1L1Lnp2RIQ3z2dt3Z1XRhVLo9O1uY4vmLrAwyKQLyYQMiXtO6rVSnOu-9OrK3cLzTNqH4ymYJIg_bHu6I77hXWdpN6_wQ35UaLDtQ4ULwK5OBc0hdmSfwvDVcu23OfHfJ4p8py4WNTRE3tng-K7a4QoLd_d9jR7cK_oo8qyDRFkRssytpi5Mdb3zMsJElFq_kHR4EozESbDhF1iFUGJwEXtGDXW7kYKqbnoDnKZe309u65BqgEnJ25osqKKjjXuFZ2xuP9CkJuLPi2DkJ6nLKIE";
      final response = await http.post(
        Uri.parse(api_url + 'login'),
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
