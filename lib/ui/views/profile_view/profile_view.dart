import 'package:flutter/material.dart';
import 'package:property_hub/ui/views/profile_view/profile_viewmodel.dart';

import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var model = context.watch<ProfileViewModel>();
    return FutureBuilder(
      future: model.profileView(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return snapshot.data;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}