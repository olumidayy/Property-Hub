import 'package:dio/dio.dart';

const baseUrl = 'https://ecx-property-hub.herokuapp.com/api';

class UserServices {
  var client = Dio(BaseOptions(baseUrl: baseUrl));
  registerUser(String name, String email, String password) async {
    var names = name.split(' ');
    try {
      var res = await client.post(
      '/accounts/register',
      data: {
        'first_name': names[0],
        'last_name': names.length > 1 ? names[1] : '',
        'email': email,
        'password': password,
      },
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    print(res);
    } catch (e) {
      print('error oo');
    }
  }

  confrirmAccount(String code) async {
    var res = await client.post('/accounts/confirm', data: {
      "confirmation_code": code,
    });
    print(res);
  }

  fetchUser() async {
    var res = await client.get('/accounts/profile');
    print(res.statusCode);
    print(res.data);
  }

  resendConfirmation(String email) async {
    var res = client.post('/accounts/resend_confirmation/', data: {
      'email': email,
    });
    print(res);
  }

  fetchListings() async {
    var res = await client.get('/listings');
    print(res);
  }

  requestToken(String email, String password) async {

  }

  fetchSaved() async {
    var res = await client.get('/listings/saved/');
    print(res);
  }

  fetchMockListings() async {
    var res = client.get('/mock​/listings​/');
    print(res);
  }
}
