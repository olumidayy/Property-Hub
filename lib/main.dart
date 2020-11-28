import 'package:flutter/material.dart';
import 'package:property_hub/ui/views/main_view/main_view.dart';
import 'package:property_hub/ui/views/onboarding_view/onboarding_view.dart';
import 'package:property_hub/ui/views/signin_view/signin_view.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEFF1FB),
        canvasColor: Color(0xFFEFF1FB),
        // This is the theme of your application.
        // is not restarted.
        primaryColor: Color(0xFF283891),
      ),
      home: MainView(),
    );
  }
}
