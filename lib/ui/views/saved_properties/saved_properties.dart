import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/property_card.dart';

class SavedProperties extends StatefulWidget {
  final VoidCallback onPressed;

  const SavedProperties({Key key, this.onPressed}) : super(key: key);

  @override
  _SavedPropertiesState createState() => _SavedPropertiesState();
}

class _SavedPropertiesState extends State<SavedProperties> {

  @override
  Widget build(BuildContext context) {
  var isEmpty = true;
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Saved Properties',
              style: TextStyle(color: purple, fontSize: 25.sp)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: isEmpty ? Padding(
            padding: EdgeInsets.all(25.sp),
            child: Container(
              width: 232.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('You don\'t have any saved properties yet..', style: TextStyle(color: appBlack, fontSize: 17.sp)),
                SizedBox(height: 25.h),
                Text(
                    'When you see a property you want to save just click the heart icon', style: TextStyle(color: appBlack, fontSize: 17.sp)),
                SizedBox(height: 11.h),
                CustomButton(
                  text: 'Start Exploring',
                  onPressed: widget.onPressed,
                )
              ]),
            ),
          ) : Center(
            child: Column(
              children: [
                for(var i = 0; i < 5; i++)
                PropertyCard(
                  imgUrl: 'https://api.adorable.io/avatars/256/7310d0120ff740f2cd0cd4a263ae81d6.png',
                  price: '750,000',
                  location: 'Lekki, Lagos.',
                  noofBedrooms: 2,
                  noofBathrooms: 2,
                  nooflivingrooms: 1,
                  isSaved: true,),
              ]
            ),
          ),
        ));
  }
}
