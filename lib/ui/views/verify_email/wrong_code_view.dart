import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_viewmodel.dart';
import 'package:provider/provider.dart';

class WrongCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);

    var model = context.watch<VerifyEmailViewModel>();
    return Scaffold(
      body: Center(
        child: model.state == ViewState.busy
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 320.h),
                  SvgPicture.asset('assets/error.svg'),
                  SizedBox(height: 6.h),
                  Text('Wrong Code! Try again',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 198.h),
                  GestureDetector(
                      onTap: () async => await model.resendCode(context),
                      child: Text('Resend code',
                          style: TextStyle(
                              color: purple,
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500))),
                ],
              ),
      ),
    );
  }
}
