import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class FavoriteButton extends StatefulWidget {
  final bool isSaved;

  const FavoriteButton({Key key, this.isSaved = false}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  var color;

  @override
  void initState(){
    color = widget.isSaved ? Color(0xFF91285B) : Colors.white;
    super.initState();
  }

  void _toggleColor(){
    setState(() {
      color = color == Colors.white ? Color(0xFF91285B) : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.h),
      child: InkWell(
        onTap: _toggleColor,
        child: Container(
          height: 50.sp,
          width: 50.sp,
          child: Icon(Icons.favorite, color: color, size: 25.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}