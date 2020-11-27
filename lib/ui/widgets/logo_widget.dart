import 'package:flutter/material.dart';

class PHLogo extends StatelessWidget {
  final double height;
  final double width;
  PHLogo({
    Key key, @required this.height, @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      height: height,
      width: width,
    );
  }
}
