import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/custom_textfield.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';
import 'package:flutter_screenutil/size_extension.dart';

class SignUpView extends StatefulWidget {
  final UserType userType;

  const SignUpView({Key key, this.userType}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isUser;

  @override
  initState(){
    super.initState();
    isUser = widget.userType == UserType.user;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        body: Center(
      child: Column(children: [
        SizedBox(height: 73.h),
        PHLogo(height: 206.h, width: 298.w),
        SizedBox(height: 21.h),
        CustomTextField(placeholder: '${isUser ? '' : 'Company '}Name'),
        SizedBox(height: 40.h),
        CustomTextField(placeholder: 'Email-ID'),
        SizedBox(height: 40.h),
        CustomTextField(placeholder: 'Password'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (val){}
              ),
              RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Color(0xFF020303),
                    fontSize: 12.sp),
                text: 'I would love to receive ',
                children: [
              TextSpan(
                  text: 'updates',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF91285B),
                      color: Color(0xFF91285B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'and',
                  style: TextStyle(
                      color: Color(0xFF020303),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'information',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFF91285B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'via my email',
                  style: TextStyle(
                      color: Color(0xFF020303),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold))
            ])),
            
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(text: 'Create Account'),
            SizedBox(height: 10.h),
            RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Color(0xFF020303),
                    fontSize: 12.sp),
                text: 'Already joined?',
                children: [
              TextSpan(
                  text: ' Sign In',
                  recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInView())),
                  style: TextStyle(
                      color: Color(0xFF91285B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold))
            ])),
          ],
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpView(userType: isUser ? UserType.agent : UserType.user))),
          child: Text('I want to be ${isUser ? 'an agent' : 'a user'}')
        )
      ]),
    ));
  }
}
