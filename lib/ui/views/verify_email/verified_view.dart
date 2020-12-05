import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';

class VerifiedView extends StatefulWidget {
  @override
  _VerifiedViewState createState() => _VerifiedViewState();
}

class _VerifiedViewState extends State<VerifiedView> {

  @override
  void initState(){
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/verified.svg'),
            SizedBox(height: 7.h),
            Text('Succesfully verified!', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}