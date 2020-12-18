
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/models/listing_model.dart';
import 'package:property_hub/core/services/user_services.dart';

class SavedPropertiesViewModel extends ChangeNotifier {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  List<Listing> _savedProperties = [];

  List<Listing> get savedProperties => _savedProperties;

  toggleViewState(){
    _state = _state == ViewState.idle ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

  addProperty(Listing property) {
    _savedProperties.add(property);
  }

  removePropertyAt(int index){
    print('here');
    _savedProperties.removeAt(index);
    notifyListeners();
  }

}