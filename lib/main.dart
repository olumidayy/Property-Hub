import 'package:flutter/material.dart';
import 'package:property_hub/ui/views/profile_view/agent_profile_view..dart';
import 'package:property_hub/ui/views/verify_email/verified_view.dart';
import 'package:property_hub/ui/views/onboarding_view/onboarding_view.dart';
// import 'package:property_hub/ui/views/verify_email/verify_email_view.dart';
// import 'package:property_hub/ui/views/verify_email/wrong_code_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0, // This removes the shadow from all App Bars.
        ),
        // scaffoldBackgroundColor: Color(0xFFEFF1FB),
        canvasColor: Color(0xFFEFF1FB),
        primaryColor: Color(0xFF283891),
      ),
      home: AgentProfileView(),
    );
  }
}
