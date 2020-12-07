import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/signin_view/signin_viewmodel.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/custom_textfield.dart';
import 'package:property_hub/ui/views/signup_view/signup_view.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';

import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    var model = context.watch<SignInViewModel>();
    return Scaffold(
        body: Center(
          child: model.state == ViewState.busy ? CircularProgressIndicator() : SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 30.h,),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: PHLogo(height: 206.h, width: 298.w),
          ),
          CustomTextField(placeholder: 'Email-ID', controller: email,),
          SizedBox(height: 40.h),
          CustomTextField(placeholder: 'Password', controller: password, forPassword: true,),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 35.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           Checkbox(value: false, onChanged: (val) {}),
          //           Text('Remember me')
          //         ],
          //       ),
          //       Text('Forgot Password?'),
          //     ],
          //   ),
          // ),
          SizedBox(height: 72.h,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(text: 'Sign In', onPressed: () async => await model.signIn(email.text, password.text, context),),
              SizedBox(height: 10.h),
              RichText(
                  text: TextSpan(
                      style:
                          TextStyle(color: Color(0xFF020303), fontSize: 12.sp),
                      text: 'You don\'t have an account?',
                      children: [
                    TextSpan(
                        text: ' Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpView())),
                        style: TextStyle(
                            color: Color(0xFF91285B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold))
                  ])),
            ],
          ),
        ]),
          ),
        ));
  }
}
