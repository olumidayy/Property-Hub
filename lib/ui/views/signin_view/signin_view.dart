import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';
import 'package:flutter_screenutil/size_extension.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        body: Center(
      child: Column(children: [
        Expanded(child: PHLogo(height: 206.h, width: 298.w)),
        SizedBox(
          width: 305.w,
          height: 50.h,
          child: TextField(
            cursorColor: Color(0xff283891),
            decoration: InputDecoration(
              hintText: 'Email-ID',
                filled: true, fillColor: Color(0xFF81868C).withOpacity(0.25)),
          ),
        ),
        SizedBox(height: 40.h),
        SizedBox(
          width: 305.w,
          height: 50.h,
          child: TextField(
            obscureText: true,
            cursorColor: Color(0xFF283891),
            decoration: InputDecoration(
              hintText: 'Password',
                focusColor: Color(0xff283891),
                filled: true,
                fillColor: Color(0xFF81868C).withOpacity(0.25)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val){}
                  ),
                  Text('Remember me')
                ],
              ),
              Text('Forgot Password?')
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(text: 'Sign In'),
              SizedBox(height: 10.h),
              RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Color(0xFF020303),
                      fontSize: 12.sp),
                  text: 'You don\'t have an account?',
                  children: [
                TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                        color: Color(0xFF91285B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold))
              ])),
            ],
          ),
        ),
        
      ]),
    ));
  }
}
