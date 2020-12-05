import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:provider/provider.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_viewmodel.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';

class VerifyEmailView extends StatefulWidget {
  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  String code;

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Color(0XFF81868C).withOpacity(0.25),
      borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
    );
  }

  updateCode(c){
    setState(() {
      code = c;
    });
    print(code);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    var model = context.watch<VerifyEmailViewModel>();
    return Scaffold(
      body: Center(
        child:  model.state == ViewState.busy ? CircularProgressIndicator() : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140.h),
              SvgPicture.asset('assets/envelope.svg'),
              SizedBox(height: 17.h),
              Container(
                width: 292.w,
                child: Text(
                    'Enter the 6-digit code sent to your email address to verify your account', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
              ),
              Container(
                // color: Colors.white,
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                child: PinPut(      
                  onChanged: updateCode,
                  fieldsCount: 6,
                  // onSubmit: (String pin) => _showSnackBar(pin, context),
                  focusNode: _pinPutFocusNode,
                  submittedFieldDecoration: _pinPutDecoration,
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration,
                ),
              ),
              SizedBox(height: 160.h),
             GestureDetector(
               onTap: () async => await model.resendCode(context),
               child: Text('Resend code', style: TextStyle(color: purple, decoration: TextDecoration.underline, fontSize: 14.sp, fontWeight: FontWeight.w500))),
              SizedBox(height: 11.h),
             CustomButton(text: 'Verify Account', onPressed: () async => await model.verfiyEmail(code, context),)
            ],
          ),
        ),
      ),
    );
  }
}
