import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';
import 'package:property_hub/ui/views/signup_view/signup_view.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/logo_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
    _controller.addListener(() {
      if (_controller.page.round() != currentIndex) {
        setState(() {
          currentIndex = _controller.page.round();
        });
      }
    });
  }
  List<String> texts = [
    'Get your dream home from your comfort zone',
    'We connect you directly to the owner of the property',
    'No hassle, no stress with\nProperty Hub'
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            PHLogo(height: 98.h, width: 142.w,),
            Expanded(
              flex: 3,
              child: SizedBox(
                  height: 406.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                            'assets/onboarding${index + 1}.svg',
                            height: 173.h,
                            width: 232.w,
                          ),
                          SizedBox(height: 82.h,),
                          SizedBox(
                        width: 238.w,
                        child: Text(
                          texts[currentIndex],
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      )
                            ]
                          );
                        },
                      ),
                    ),
                  ])),
            ),
            Expanded(
              flex: 1,
                        child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotWidth: 10.sp,
                        dotHeight: 10.sp,
                        radius: 5.sp,
                      ),
                      controller: _controller,
                      count: 3,
                    ),
                  ),
                  currentIndex < 2 ? CustomButton(
                    text: 'Get Started'
                  ) : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CustomButton(
                    text: 'I\'m a User',
                    onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpView())),
                  ),
                  SizedBox(width: 12.w),
                   CustomButton(
                    text: 'I\'m an Agent',
                    onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpView())),
                  )
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Color(0xFF020303), fontSize: 12.sp, fontWeight: FontWeight.w400),
                        text: 'Already Joined?',
                        children: [
                          TextSpan(
                            text: ' Sign In', 
                            recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInView())),                           

                          style: TextStyle(color: Color(0xFF91285B), fontSize: 13.sp, fontWeight: FontWeight.w600))
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
