import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile Settings',
            style: TextStyle(
                color: purple, fontSize: 25.sp, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 45.h, bottom: 17.h),
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
            
          ],
        ),
      ),
    );
  }
}
