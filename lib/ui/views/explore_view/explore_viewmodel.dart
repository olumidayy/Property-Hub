
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';



class ExploreViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  get listings async => await mockListings();

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  mockListings() async {
    try {
      toggleViewState();
      var res = await services.fetchMockListings();
      var statusCode = res.statusCode;
      print(statusCode);
      toggleViewState();
      if(statusCode == 200) {
        // var prefs = await SharedPreferences.getInstance();
        print(res.body);
        return res.body;
      } else {
        print('wahala');
      }
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }
}