
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'https://ecx-property-hub.herokuapp.com/api';

class UserServices {
  var options = Options(
    contentType: "application/json",
    followRedirects: true,
    validateStatus: (status) {
      return status < 500;
    },
  );
  var client = Dio(BaseOptions(baseUrl: baseUrl));
  registerUser(String name, String email, String password) async {
    var names = name.split(' ');
    try {
      var res = await client.post(
        '/accounts/register/',
        data: {
          'email': email,
          'first_name': names[0],
          'last_name': names.length > 1 ? names[1] : names[0],
          'password': password,
        },
        options: options,
      );
      print(res.statusCode);
      return res;
    } catch (e) {
      print('error oo');
    }
  }

  confrirmAccount(String code) async {
    try {
      var res = await client.post('/accounts/confirm/',
          data: {
            "confirmation_code": int.parse(code),
          },
          options: options);
      print(res);
      return res;
    } catch (e) {
      
    }
  }

  fetchUser() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var res = await client.get('/accounts/profile/', options: options.merge(headers: {
      'Authorization': 'Token $token',
    }));
    print(res.statusCode);
    print(res.data);
    return res;
  }

  resendConfirmation(String email) async {
    var res = client.post('/accounts/resend_confirmation/', data: {
      'email': email,
    });
    print(res);
  }

  fetchListings() async {
    var res = await client.get('/listings/');
    print(res);
    return res;
  }

  requestToken(String email, String password) async {
    var res;
    try {
      res = await client.post('/accounts/request_token/', data: {
        'username': email,
        'password': password
      }, options: options);
      print(res);
    } catch (e) {
      print('error o');
    }
    return res;
  }

  fetchSaved() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var res = await http.get('$baseUrl/listings/saved/', headers: {
      'Authorization': 'Token $token',
    });
    print(res);
    return res;
  }

  fetchMockListings() async {
    var res = await http.get('$baseUrl/mock/listings'); //.get('/mock/listings​/', options: options);
    // print(res);
    return res;
  }

  toggleSave(id) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var saved = await fetchSaved();
    List savedIds = jsonDecode(saved.body).map((listing) => listing['id']).toList();
    print('done here');
    if(savedIds.contains(id)){
      return await http.post('$baseUrl/listings/$id/unsave/', headers: {
        'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    });
    }
    return await http.post('$baseUrl/listings/$id/save/', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    });
  }
}
