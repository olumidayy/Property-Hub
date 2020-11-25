import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({
    Key key, this.onPressed, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.sp)
        ),
          onPressed: () {},
          color: Color(0xFF283891),
          child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
}