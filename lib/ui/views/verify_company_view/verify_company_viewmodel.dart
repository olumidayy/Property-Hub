
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/agent_services.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCompanyViewModel extends ChangeNotifier {
  AgentServices services = AgentServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  signUp(name, email, password, phoneNumber, companyName, context) async {
    try {
      toggleViewState();
      print(state);
      var res = await services.registerAgent(name, email, password, companyName, phoneNumber);
      print(res.data['user']['email'].first);
      var statusCode = res.statusCode;
      var err = (res.data).values.first[0];
      toggleViewState();
      print(state);
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView()));
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
      print(state);
      print(e);
    }
  }
}