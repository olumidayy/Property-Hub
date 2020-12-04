import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class RatingStars extends StatefulWidget {
  final int rating;
  final bool isReactive;

  const RatingStars({Key key, this.rating = 0, this.isReactive = false}) : super(key: key);
  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  var _rating;
  
  @override
  void initState(){
    _rating = widget.rating;
    super.initState();
  }


  void _handleTap(rating) {
    setState(() {
      _rating = widget.isReactive ? rating : _rating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(var i = 1; i < 6; i++)
          InkWell(
            onTap: () => _handleTap(i),
            child: Icon(Icons.star, size: widget.isReactive ? 36.w : 16.w, color: _rating < i ? Color(0xFF969696) : Color(0xFFEABD1D),),
          )
        ]
      ),
    );
  }
}