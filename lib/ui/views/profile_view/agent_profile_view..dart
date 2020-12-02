import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';

import 'profile_view.dart';

class AgentProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 38.h, bottom: 17.h),
                height: 188.h,
                width: 188.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(12.sp),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage('assets/dp.jpg')))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wade Warren',
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600)),
                Icon(Icons.edit, color: blue)
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(children: [
                OptionTile(text: 'Apartments'),
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
                Row(
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}

