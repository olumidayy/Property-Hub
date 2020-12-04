
import 'package:flutter/foundation.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';

class SignUpViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  signUp(name, email, password) async {
    try {
      toggleViewState();
      await services.registerUser(name, email, password);
      toggleViewState();
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }
}