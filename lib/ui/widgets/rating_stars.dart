import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class RatingStars extends StatefulWidget {
  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  var _rating = 0;
  void _handleTap(rating) {
    setState(() {
      _rating = rating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for(var i = 1; i < 6; i++)
          InkWell(
            onTap: () => _handleTap(i),
            child: Icon(Icons.star, size: 16.w, color: _rating < i ? Color(0xFF969696) : Color(0xFFEABD1D),),
          )
        ]
      ),
    );
  }
}