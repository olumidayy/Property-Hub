import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool forPassword;

  const CustomTextField({Key key, @required this.placeholder, @required this.controller, this.forPassword=false})
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
        controller: widget.controller,
        obscureText: widget.forPassword,
        cursorColor: Color(0xFF283891),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF919297), width: 2.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF283891), width: 2.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF919297), width: 2.5)),
            hintText: widget.placeholder,
            focusColor: Color(0xff283891),
            filled: true,
            fillColor: Color(0xFF81868C).withOpacity(0.25)),
      ),
    );
  }
}
