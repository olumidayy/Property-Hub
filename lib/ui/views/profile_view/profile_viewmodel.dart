
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/core/services/user_services.dart';
import 'package:property_hub/ui/views/profile_view/agent_profile_view..dart';
import 'package:property_hub/ui/views/profile_view/user_profile_view.dart';

class ProfileViewModel {
  UserServices services = UserServices();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  bool _isUser;

  String _firstname;
  String _lastname;

  // String get firstname => _firstname;
  // String get lastname => _lastname;
  String get name => _firstname == _lastname ? _firstname : '$_firstname $_lastname';
  String get initials => _firstname == _lastname ? _firstname[0] : _firstname[0] + _lastname[0];

  bool get user => _isUser;

  profileView() async {
    var profile = await services.fetchUser();
    _isUser = profile.data['is_customer'];
    _firstname = profile.data['first_name'];
    _lastname = profile.data['last_name'];
    return _isUser ? UserProfileView() : AgentProfileView();
  }

}