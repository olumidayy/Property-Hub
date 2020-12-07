
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';
import 'package:property_hub/ui/views/verify_email/verified_view.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyEmailViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  verfiyEmail(code, context) async {
    try {
      toggleViewState();
      var res = await services.confrirmAccount(code);
      var statusCode = res?.statusCode;
      print(statusCode);
      print((res.data.values.toList())[0]);
      toggleViewState();
      if(statusCode == 200 || statusCode == 201) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifiedView()));
      } else {
        //
      }
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }

  resendCode(context) async {
    var prefs = await SharedPreferences.getInstance();
     try {
      toggleViewState();
      var email = prefs.getString('email');
      var res = await services.confrirmAccount(email);
      var statusCode = res.statusCode;
      toggleViewState();
      print(res.data.vlaues);
      if(statusCode == 200 || statusCode == 201) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyEmailView()));
      } else {
        Fluttertoast.showToast(
          msg: 'An error occurred',
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