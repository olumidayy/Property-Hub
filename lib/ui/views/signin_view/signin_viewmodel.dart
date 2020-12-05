
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';
import 'package:property_hub/ui/views/main_view/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  signIn(email, password, context) async {
    try {
      toggleViewState();
      var res = await services.requestToken(email, password);
      var statusCode = res.statusCode;
      var msg = (res.data).values.first;
      var err = (res.data).values.first[0];
      toggleViewState();
      if(statusCode == 200) {
        var prefs = await SharedPreferences.getInstance();
        // print(res.data);
        prefs.setString('token', res.data['token']);
        print(prefs.get('email'));
        print(prefs.get('token'));
        Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()));
      } else {
        Fluttertoast.showToast(
            msg: err ?? 'An error occured',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }
}