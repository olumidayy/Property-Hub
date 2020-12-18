
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/agent_services.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCompanyViewModel extends ChangeNotifier {
  AgentServices services = AgentServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState({state}){
    if(state == null){
      _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    } else {
      _state = state;
    }
    notifyListeners();
  }

  signUp(name, email, password, phoneNumber, companyName, context) async {
    try {
      toggleViewState();
      print(state);
      var res = await services.registerAgent(name, email, password, companyName, phoneNumber);
      print(res.data);
      var statusCode = res.statusCode;
      toggleViewState();
      print(statusCode);
      if(statusCode == 200 || statusCode == 201) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Fluttertoast.showToast(
            msg: 'Sign up success',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyEmailView()));
      } else {
        var err = res.data['user']['email'].first;
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
      toggleViewState(state: ViewState.idle);
      print(state);
      print(e);
    }
  }
}