import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/widgets/property_card.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);

    final assetName = 'prop0.jpg';
    final price = '650,000';
    final location = 'Alapere, Lagos.';
    final noofBedrooms = 2;
    final noofBathrooms = 2;
    final nooflivingrooms = 1;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(height: 40.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 23.h),
              height: 38.h > 35 ? 35 : 38.h,
              width: 276.w,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  hintText: 'Where do you want to live?',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(100.sp)),
                  filled: true,
                  fillColor: Color(0xFFD9D9D9)
                ),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.w),
              padding: EdgeInsets.all(6.25.sp),
              child: SvgPicture.asset('assets/filter.svg'),
            )
          ]
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Row(
            children: [
              Text('Suggestions for you', style: TextStyle(color: purple, fontSize: 18.sp, fontWeight: FontWeight.w600,)),
            ],
          ),
        ),
        PropertyCard(
            assetName: assetName,
            price: price,
            location: location,
            noofBedrooms: noofBedrooms,
            noofBathrooms: noofBathrooms,
            nooflivingrooms: nooflivingrooms),
        PropertyCard(
            assetName: 'prop1.jpg',
            price: '1,000,000',
            location: 'Gwarimpa, Abuja.',
            noofBedrooms: 5,
            noofBathrooms: 6,
            nooflivingrooms: 2),
        PropertyCard(
            assetName: 'prop2.jpg',
            price: price,
            location: location,
            noofBedrooms: noofBedrooms,
            noofBathrooms: noofBathrooms,
            nooflivingrooms: nooflivingrooms),
        PropertyCard(
            assetName: 'prop3.png',
            price: '750,000',
            location: 'Lekki, Lagos.',
            noofBedrooms: noofBedrooms,
            noofBathrooms: noofBathrooms,
            nooflivingrooms: nooflivingrooms),
      ]),
    );
  }
}
