import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'https://ecx-property-hub.herokuapp.com/api';

class AgentServices {
  var options = Options(
    contentType: "application/json",
    followRedirects: true,
    validateStatus: (status) {
      return status < 500;
    },
  );
  var client = Dio(BaseOptions(baseUrl: baseUrl));
  registerAgent(String name, String email, String password) async {
    var names = name.split(' ');
    try {
      var res = await client.post(
        '/accounts/register/agent/',
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


  fetchUser() async {
    var res = await client.get('/accounts/profile/', options: options);
    print(res.statusCode);
    print(res.data);
    return res;
  }

  createListing(description, location, price, isFurnished, baths, beds, lounges) async {
    var res = await client.post('/listings​/create​/', data: {
      'name': description,
      'description': description,
      'location': location,
      'price': price,
      'baths': baths,
      'beds': beds,
      'is_furnished': isFurnished,
      'lounges': lounges,
    });
    return res;
  }

  deleteListing(id) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var res = client.delete('/listings/$id/delete/', options: options.merge(headers: {
      'Authorization': 'Token $token',
    }));
    return res;
  }

}