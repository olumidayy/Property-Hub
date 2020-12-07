import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/enums/enums.dart';
import 'package:property_hub/ui/views/signup_view/signup_view.dart';
import 'package:property_hub/ui/views/verify_company_view/verify_company_viewmodel.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/custom_textfield.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';
import 'package:flutter_screenutil/size_extension.dart';

import 'package:provider/provider.dart';

class VerifyCompany extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const VerifyCompany({
    Key key,
    @required this.name,
    @required this.email,
    @required this.password,
  }) : super(key: key);
  @override
  _VerifyCompanyState createState() => _VerifyCompanyState();
}

class _VerifyCompanyState extends State<VerifyCompany> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController agentNumber = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<VerifyCompanyViewModel>();
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView(userType: UserType.agent,))),
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xFF91285B)),
        ),
        body: model.state == ViewState.busy ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
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
              CustomTextField(
                placeholder: 'Company Name',
                controller: name,
              ),
              SizedBox(height: 43.h),
              CustomTextField(
                placeholder: 'Company Phone Number',
                controller: number,
              ),
              SizedBox(height: 43.h),
              // CustomTextField(placeholder: 'Agent Verification Number', controller: agentNumber,),
              SizedBox(height: 81.h),
              CustomButton(
                text: 'Verify Company',
                onPressed: () => model.signUp(widget.name, widget.email,
                    widget.password, number.text, name.text, context),
              ),
            ]),
          ),
        ));
  }
}
