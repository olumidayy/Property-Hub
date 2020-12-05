import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/main_view/main_view.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/custom_textfield.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';
import 'package:flutter_screenutil/size_extension.dart';

class VerifyCompany extends StatefulWidget {
  final UserType userType;

  const VerifyCompany({Key key, this.userType}) : super(key: key);
  @override
  _VerifyCompanyState createState() => _VerifyCompanyState();
}

class _VerifyCompanyState extends State<VerifyCompany> {
  bool isUser;

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController agentNumber = TextEditingController();

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
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
              CustomTextField(placeholder: 'Company Name', controller: name,),
              SizedBox(height: 43.h),
              CustomTextField(placeholder: 'Company Phone Number', controller: number,),
              SizedBox(height: 43.h),
              CustomTextField(placeholder: 'Agent Verification Number', controller: agentNumber,),
              SizedBox(height: 81.h),
              CustomButton(text: 'Verify Company', onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainView())),),
            ]),
          ),
        ));
  }
}
