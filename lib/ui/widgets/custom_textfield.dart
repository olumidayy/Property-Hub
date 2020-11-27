import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;

  const CustomTextField({Key key, @required this.placeholder})
      : super(key: key);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.w,
      height: 50.h,
      child: TextField(
        obscureText: true,
        cursorColor: Color(0xFF283891),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            hintText: widget.placeholder,
            focusColor: Color(0xff283891),
            filled: true,
            fillColor: Color(0xFF81868C).withOpacity(0.25)),
      ),
    );
  }
}
