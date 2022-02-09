import 'package:http/http.dart' as http;

import 'dart:convert';

// ignore: constant_identifier_names
const String base_url = 'https://phpstack-351614-1150808.cloudwaysapps.com';
// ignore: constant_identifier_names
const api_url = base_url + '/api/customer/';

const String googleAPIKey = 'AIzaSyAZgqO2gavNBbPsJ6tXLq3L_9Ax9WpKxpk';

class ApiEndpoints {
  // loginRegister
  static String checkCode = 'checkCode';
  static String activate = 'activate';
  static get resetPassword => api_url + 'resetPassword';
  static get register => api_url + 'register';

  static get phonesAdd => api_url + 'phones/add';
  static get phones => api_url + 'phones';
  //sms_code
  static get sendRegCode => api_url + activate;
  static get resetSmsCode => api_url + 'activate';

  // address
  static get addressAdd => api_url + 'addresses/add';
  static get address => api_url + 'addresses';
  static get addressDelete => api_url + 'addresses/delete';

  // pickup
  static get pickupAdd => api_url + 'pickups/add';
  static get pickupsOngoing => api_url + 'pickups/ongoing';
  static get pickupsPassed => api_url + 'pickups/passed';
  static pickupCancel(id) => api_url + 'pickups/cancel/$id';
  static pickupEdit(id) => api_url + 'pickups/edit/$id';
  static get exist => base_url + '/api/bag/exists';
}

class RequestManager {
  // static RequestManager shared = RequestManager();

  void makePostRequest(
      Map parametr, String apiEndpoint, Function closure) async {
    String url = api_url + apiEndpoint;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(parametr),
      );
      print(response.body);
      var data = jsonDecode(response.body);
      closure(data);
    } catch (error) {
      print(error);
    }
  }
}
