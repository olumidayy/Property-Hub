import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/views/apartments_view/apartments_view.dart';
import 'package:property_hub/ui/views/profile_view/profile_viewmodel.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';

import 'user_profile_view.dart';

import 'package:provider/provider.dart';

class AgentProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProfileViewModel>();
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile',
            style: TextStyle(
                color: purple, fontSize: 25.sp, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                  margin: EdgeInsets.only(top: 40.h, bottom: 17.h),
                  child: CircleAvatar(
                radius: 94.h,
                child: Text(model.initials, style: TextStyle(fontSize: 60.sp),),
              ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.name,
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600)),
                // Icon(Icons.edit, color: blue)
              ],
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(children: [
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ApartmentsView())),
                  child: OptionTile(text: 'Apartments')),
                Divider(),
                OptionTile(text: 'About us'),
                Divider(),
                OptionTile(text: 'Notifications'),
                Divider(),
                OptionTile(text: 'Help Center'),
                Divider(),
                OptionTile(text: 'Terms and Conditions'),
                Divider(),
                OptionTile(text: 'Rate Us'),
                Divider(),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Log out',
                          style: TextStyle(
                              color: purple,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500)),
                      Icon(Icons.chevron_right_sharp, color: blue)
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

