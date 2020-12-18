import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/views/add_apartment/add_apartment.dart';
import 'package:property_hub/ui/views/profile_view/profile_viewmodel.dart';
import 'package:property_hub/ui/widgets/rating_stars.dart';

import 'package:provider/provider.dart';

class ApartmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var model = context.watch<ProfileViewModel>();
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios, color: appBlack)),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 17.h),
                  child: CircleAvatar(
                radius: 94.h,
                child: Text(model.initials, style: TextStyle(fontSize: 60.sp),),
              )),
              Text(model.name, style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),),
              RatingStars(rating: 0,),
              Text('(0 ratings)', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300)),
              SizedBox(height: 36.h),
              GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddApartmentView())),
                    icon: Icon(Icons.add_circle_outline, color: appBlack, size: 66.h)),
                  Container(
                    height: 122.h,
                    width: 122.h,
                    decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/prop0.jpg')
                    ))
                  ),
                  Container(
                    height: 122.h,
                    width: 122.h,
                    decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/prop1.jpg')
                    ))
                  ),
                  Container(
                    height: 122.h,
                    width: 122.h,
                    decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/prop2.jpg')
                    ))
                  ),
                  Container(
                    height: 122.h,
                    width: 122.h,
                    decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/prop3.png')
                    ))
                  )
                ]
              )
            ]
          ),
        ),
      ),
    );
  }
}