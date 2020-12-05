import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_hub/ui/views/explore_view/explore_viewmodel.dart';
import 'package:property_hub/ui/views/onboarding_view/onboarding_view.dart';
import 'package:property_hub/ui/views/signin_view/signin_viewmodel.dart';
import 'package:property_hub/ui/views/signup_view/signup_viewmodel.dart';
import 'package:property_hub/ui/views/verify_email/verify_email_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider<SignInViewModel>(create: (_) => SignInViewModel()),
        ChangeNotifierProvider<VerifyEmailViewModel>(create: (_) => VerifyEmailViewModel()),
        ChangeNotifierProvider<ExploreViewModel>(create: (_) => ExploreViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
          ),
          textTheme: GoogleFonts.barlowTextTheme(
            Theme.of(context).textTheme,
          ),
          // scaffoldBackgroundColor: Color(0xFFEFF1FB),
          canvasColor: Color(0xFFEFF1FB),
          primaryColor: Color(0xFF283891),
        ),
        home: OnboardingView(),
      ),
    );
  }
}
