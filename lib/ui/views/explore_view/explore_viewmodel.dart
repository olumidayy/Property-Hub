
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/models/listing_model.dart';
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

  toggleSaved(id) async {
    print('here');
    try {
      // toggleViewState();
      var res = await services.toggleSave(id);
      var statusCode = res.statusCode;
      print(res.body);
      // toggleViewState();
      if(statusCode == 200 || statusCode == 201) {
        print('saved');
      } else {
        print('wahala');
      }
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }

  mockListings() async {
    try {
      // toggleViewState();
      var res = await services.fetchMockListings();
      var statusCode = res.statusCode;
      print(statusCode);
      // toggleViewState();
      if(statusCode == 200) {
        // var prefs = await SharedPreferences.getInstance();
        List lis = jsonDecode(res.body).map((it) => Listing.fromMap(it)).toList();
        print(lis[0].imageUrls);
        return lis;
      } else {
        print('wahala');
      }
    } catch (e) {
      toggleViewState();
      print(e);
    }
  }
}