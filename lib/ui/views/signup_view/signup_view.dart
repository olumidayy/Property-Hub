import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:property_hub/ui/views/signup_view/signup_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/custom_textfield.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';

class SignUpView extends StatefulWidget {
  final UserType userType;

  const SignUpView({Key key, this.userType = UserType.user}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isUser;
  bool receiveUpdates = false;

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  _handleChange(bool value) {
    setState(() {
      receiveUpdates = value;
    });
  }

  @override
  initState() {
    super.initState();
    isUser = widget.userType == UserType.user;
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<SignUpViewModel>();
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        body: Center(
      child: model.state == ViewState.busy
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 73.h),
                PHLogo(height: 206.h, width: 298.w),
                SizedBox(height: 21.h),
                CustomTextField(
                  placeholder: '${isUser ? '' : 'Company '}Name',
                  controller: name,
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  placeholder: 'Email-ID',
                  controller: email,
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  placeholder: 'Password',
                  controller: password,
                  forPassword: true,
                ),
                SizedBox(height: 29.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                            value: receiveUpdates,
                            onChanged: _handleChange,
                            activeColor: Color(0xFF020303)),
                      ),
                      Flexible(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Color(0xFF020303), fontSize: 12.w),
                                text: 'I would love to receive ',
                                children: [
                                  TextSpan(
                                      text: 'updates',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xFF91285B),
                                          color: Color(0xFF91285B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ' and',
                                      style: TextStyle(
                                        color: Color(0xFF020303),
                                        fontSize: 12.sp,
                                      )),
                                  TextSpan(
                                      text: ' information ',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF91285B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: 'via my email',
                                      style: TextStyle(
                                        color: Color(0xFF020303),
                                        fontSize: 12.sp,
                                      ))
                                ])),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 69.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'Create Account',
                      onPressed: () async => await model.signUp(
                          name.text, email.text, password.text, context),
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Color(0xFF020303), fontSize: 12.sp),
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
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpView(
                                userType:
                                    isUser ? UserType.agent : UserType.user))),
                    child: Text(
                      'I want to be ${isUser ? 'an agent' : 'a user'}',
                      style: TextStyle(
                          color: Color(0xFF91285B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ))
              ]),
            ),
    ));
  }
}
