
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  signUp(name, email, password, context) async {
    try {
      toggleViewState();
      var res = await services.registerUser(name, email, password);
      var statusCode = res.statusCode;
      var err = (res.data).values.first[0];
      toggleViewState();
      if(statusCode == 200 || statusCode == 201) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Fluttertoast.showToast(
            msg: 'Logged In',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmailView()));
      } else {
          Fluttertoast.showToast(
            msg: err ?? 'An error occurred',
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