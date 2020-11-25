import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PHLogo extends StatelessWidget {
  final double height;
  final double width;
  PHLogo({
    Key key, this.height = 98, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'assets/logo.svg',
      height: height,
      width: width,
    );
  }
}
