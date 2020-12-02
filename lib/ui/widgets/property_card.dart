import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/ui/views/property_detail/property_detail.dart';
import 'package:property_hub/ui/widgets/favorite_button.dart';
import 'package:flutter_screenutil/size_extension.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({
    Key key,
    @required this.assetName,
    @required this.price,
    @required this.location,
    @required this.noofBedrooms,
    @required this.noofBathrooms,
    @required this.nooflivingrooms,
    this.isSaved = false,
  }) : super(key: key);

  final String assetName;
  final String price;
  final String location;
  final int noofBedrooms;
  final int noofBathrooms;
  final int nooflivingrooms;
  final bool isSaved;

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
        Navigator.push(context, MaterialPageRoute(builder:(context) => PropertyDetail()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18.sp),
        height: 285.h,
        width: 325.w,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15.sp),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/${widget.assetName}')
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
              alignment: Alignment.topRight,
                child: FavoriteButton(isSaved: widget.isSaved,),
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.sp),
                width: 325.w,        
                decoration: BoxDecoration(      
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.sp))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Company Verified', style: TextStyle(fontSize: 17, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700)),
                    SizedBox(height: 10.h,),
                    RichText(
                      text: TextSpan(
                      text: '#${widget.price}',
                      style: TextStyle(color: Color(0xFF020303), fontSize: 20.sp, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(text: '/Year', style: TextStyle(color: Color(0xFF8C8B8E)))
                      ]
                    )),
                    Text(widget.location, style: TextStyle(color: Color(0xFF020303), fontSize: 16.sp, fontWeight: FontWeight.w500),),
                    SizedBox(height: 17.h,),
                    Row(
                      children: [
                        Row(children: [
                          SvgPicture.asset('assets/bedroom.svg'),
                          SizedBox(width: 5.w,),
                          Text('${widget.noofBedrooms}', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                        ],),
                        SizedBox(width: 25.w,),
                        Row(children: [
                          SvgPicture.asset('assets/bathroom.svg'),
                          SizedBox(width: 5.w,),
                          Text('${widget.noofBathrooms}', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                        ],),
                        SizedBox(width: 25.w,),
                        Row(children: [
                          SvgPicture.asset('assets/living_room.svg'),
                          SizedBox(width: 5.w,),
                          Text('${widget.nooflivingrooms}', style: TextStyle(color: Color(0xFF020303), fontSize: 17.sp, fontWeight: FontWeight.w500)),
                        ],),
                      ]
                    )
                  ]
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}