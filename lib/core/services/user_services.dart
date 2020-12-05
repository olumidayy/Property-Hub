import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:property_hub/core/models/listing_model.dart';

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
    var res = await client.get('/accounts/profile/', options: options);
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
    var res = await client.post('/accounts/request_token/', data: {
      'username': email,
      'password': password
    }, options: options);
    print(res);
    return res;
  }

  fetchSaved() async {
    var res = await client.get('/listings/saved/');
    print(res);
  }

  fetchMockListings() async {
    var res = await http.get('https://ecx-property-hub.herokuapp.com/api/mock/listings') ;//.get('/mock/listings​/', options: options);
    // print(res);
    return jsonDecode(res.body).map((it) => Listing.fromMap(it)).toList();
  }
}
