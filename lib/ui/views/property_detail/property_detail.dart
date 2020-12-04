import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/widgets/favorite_button.dart';
import 'package:property_hub/ui/widgets/rating_stars.dart';

class PropertyDetail extends StatefulWidget {
  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  @override
  Widget build(BuildContext context) {

    _showMaterialDialog() {
      showDialog(
        useSafeArea: false,
          context: context,
          builder: (_) => new AlertDialog(
            insetPadding: EdgeInsets.all(25.w),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                title: Container(
                  height: 80.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () =>Navigator.pop(context),
                            icon: Icon(Icons.close),
                          )
                        ],
                      ),
                      Positioned(
                        top: -35.h,
                        child: CircleAvatar(radius: 35.sp, backgroundImage: AssetImage('assets/dp.jpg'),)
                      )
                    ],
                  ),
                ),
                content: SizedBox(
                  height: 225.h,
                  child: Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Wade Warren',
                        style: TextStyle(
                            color: appBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500)),
                        SizedBox(width: 3),
                        SvgPicture.asset('assets/verified_account.svg')
                      ]
                    ),
                    SizedBox(height: 11.h),
                    Text('How would you rate this agent ?',
                        style: TextStyle(
                            color: appBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 15.h),
                    RatingStars(isReactive: true,),
                    SizedBox(height: 21.h),
                    Text('Maybe next time',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            color: appBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400)),
                  ]),
                ),
              ));
    }
    
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(20.w),
              width: 375.w,
              height: 341.h,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back_ios, size: 30,), onPressed: () => Navigator.pop(context)),
                    FavoriteButton(),
                  ]
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.sp)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/prop0.jpg'),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 27.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                    text: '#760,000',
                    style: TextStyle(color: Color(0xFF020303), fontSize: 20.sp, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(text: '/Year', style: TextStyle(color: Color(0xFF8C8B8E))),
                      TextSpan(text: '  (excluding agent fees)', style: TextStyle(color: Color(0xFF020303), fontWeight: FontWeight.w300, fontSize: 14.sp)),
                    ]
                  )),
                  Text('Gwarimpa, Abuja.', style: TextStyle(color: Color(0xFF020303), fontSize: 16.sp, fontWeight: FontWeight.w500),),
                  SizedBox(height: 17.h,),
                  Row(
                    children: [
                      Row(children: [
                        SvgPicture.asset('assets/bedroom.svg'),
                        SizedBox(width: 5.w,),
                        Text('2 Beds', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                      ],),
                      SizedBox(width: 25.w,),
                      Row(children: [
                        SvgPicture.asset('assets/bathroom.svg'),
                        SizedBox(width: 5.w,),
                        Text('2 Baths', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                      ],),
                      SizedBox(width: 25.w,),
                      Row(children: [
                        SvgPicture.asset('assets/living_room.svg'),
                        SizedBox(width: 5.w,),
                        Text('1 Lounge', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                      ],),
                    ]
                  ),
                  SizedBox(height: 30.h),
                  Text('Description', style: TextStyle(color: Color(0xFF020303), fontSize: 18.sp, fontWeight: FontWeight.w700)),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing tincidunt ullamcorper tempor turpis mauris. Eget mi nulla turpis amet aliquet pretium quis. ', style: TextStyle(color: Color(0xFF020303), fontSize: 14.sp, fontWeight: FontWeight.w300)),
                  SizedBox(height: 18.h),
                  Text('Property Agent', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w700)),
                  ListTile(
                    leading: InkWell(
                      onTap: _showMaterialDialog,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/dp.jpg'),
                        radius: 25.sp,),
                    ),
                    title: Row(
                      children: [
                        Text('Joseph Morgan'),
                        SizedBox(width: 3),
                        SvgPicture.asset('assets/verified_account.svg')
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      RatingStars(rating: 4, isReactive: false,),
                      Text(' (45 ratings)', style: TextStyle(color: Color(0xFF020303), fontSize: 14.sp, fontWeight: FontWeight.w300))
                    ],),
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                      padding: EdgeInsets.all(12.sp),
                      child: Icon(Icons.phone, color: Colors.white,))
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    RichText(
                    text: TextSpan(
                      text: 'Agency fees',
                      style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(text: '(one time payment)', style: TextStyle(color: Color(0xFF020303), fontWeight: FontWeight.w300, fontSize: 14.sp)),
                      ]
                    )),
                    Text('#100,000', style: TextStyle(color: Color(0xFF020303), fontSize: 18.sp, fontWeight: FontWeight.w500),)
                  ],)
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}