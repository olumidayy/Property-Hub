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
  initState() {
    super.initState();
    isUser = widget.userType == UserType.user;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios), color: Color(0xFF91285B)),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: 73.h),
            PHLogo(height: 206.h, width: 298.w),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              width: 259.w,
              child: Text(
                'Please fill this form so we can verify your company',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            CustomTextField(placeholder: 'Company Name'),
            SizedBox(height: 43.h),
            CustomTextField(placeholder: 'Company Phone Number'),
            SizedBox(height: 43.h),
            CustomTextField(placeholder: 'Agent Verification Number'),
            SizedBox(height: 81.h),
            CustomButton(text: 'Verify Company'),
          ]),
        ));
  }
}
