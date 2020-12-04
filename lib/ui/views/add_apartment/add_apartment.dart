import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';

class AddApartmentView extends StatefulWidget {
  @override
  _AddApartmentViewState createState() => _AddApartmentViewState();
}

class _AddApartmentViewState extends State<AddApartmentView> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _bathController = TextEditingController();
  TextEditingController _bedController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _furnishController = TextEditingController();

  _checkfields(s) {
    bool valid = true;
    var controllers = [
      _controller,
      _locationController,
      _typeController,
      _bathController,
      _bedController,
      _furnishController,
      _priceController
    ];
    for (var ct in controllers) {
      if (ct.text == null || ct.text.trim().isEmpty) {
        valid = false;
      }
    }
    setState(() {
      _isActive = valid;
      print(valid);
    });
  }

  var location = 'Location';
  var property = 'Property Type';
  var textLength = 0;
  bool _isActive = false;

  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        textLength = _controller.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _showMaterialDialog() {
      showDialog(
        useSafeArea: false,
          context: context,
          builder: (_) => new AlertDialog(
            insetPadding: EdgeInsets.all(25.w),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                content: SizedBox(
                  height: 235.h,
                  child: Column(children: [
                    SvgPicture.asset('assets/verified.svg'),
                    SizedBox(height: 7),
                    Text('Apartment succesfully added!',
                        style: TextStyle(
                            color: appBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600))
                  ]),
                ),
              ));
    }

    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: appBlack,
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Add Apartment',
            style: TextStyle(
                color: purple, fontSize: 25.sp, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(35.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${_controller.text.length}/50',
                      style: TextStyle(
                          color: appBlack.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400))
                ],
              ),
              TextField(
                controller: _controller,
                minLines: 3,
                maxLength: 50,
                maxLengthEnforced: true,
                onChanged: _checkfields,
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: 'Describe the apartment...',
                    hintStyle: TextStyle(
                        color: appBlack.withOpacity(0.5),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    counter: SizedBox(),
                    prefixIcon: Image.asset(
                      'assets/dp.jpg',
                      height: 110.h,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFD3D6DF)),
              ),
              SizedBox(height: 23.h),
              Text('What are the features of the apartment?',
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              CTextField(
                controller: _locationController,
                label: location,
                onChanged: _checkfields,
              ),
              CutomPopUp(
                label: property,
                controller: _typeController,
                option1: 'Apartment',
                option2: 'Duplex',
                onChanged: _checkfields,
              ),
              CTextField(
                controller: _bedController,
                label: 'Bedrooms',
                onChanged: _checkfields,
              ),
              CTextField(controller: _bathController, label: 'Bathrooms'),
              CTextField(
                controller: _priceController,
                label: 'Price',
                onChanged: _checkfields,
              ),
              CutomPopUp(
                label: 'Furniture',
                controller: _furnishController,
                option1: 'Furnished',
                option2: 'Unfurnished',
                onChanged: _checkfields,
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  text: 'DONE',
                  isActive: _isActive,
                  onPressed: _showMaterialDialog),
            ],
          ),
        ),
      ),
    );
  }
}

class CutomPopUp extends StatefulWidget {
  const CutomPopUp({
    Key key,
    @required this.label,
    @required TextEditingController controller,
    @required this.option1,
    @required this.option2,
    this.onChanged,
  })  : _controller = controller,
        super(key: key);

  final String label;
  final TextEditingController _controller;
  final String option1;
  final String option2;
  final onChanged;

  @override
  _CutomPopUpState createState() => _CutomPopUpState();
}

class _CutomPopUpState extends State<CutomPopUp> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 45,
          width: 305.w,
          child: Row(
            children: [
              Text(
                '${widget.label}- ',
                style: TextStyle(
                    color: appBlack.withOpacity(0.5),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                widget._controller.text,
                style: TextStyle(
                    color: appBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: blue,
                width: 1.5,
              )),
        ),
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: Text(widget.option1), value: widget.option1),
              new PopupMenuItem<String>(
                  child: Text(widget.option2), value: widget.option2),
            ],
        onSelected: (str) {
          widget.onChanged(str);
          setState(() {
            widget._controller.text = str;
          });
        });
  }
}

class CTextField extends StatefulWidget {
  CTextField({
    Key key,
    @required TextEditingController controller,
    @required this.label,
    this.onChanged,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String label;
  final onChanged;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(
        color: blue,
        width: 1.5,
      ));

  var _style = TextStyle(
      color: appBlack.withOpacity(0.5),
      fontSize: 18.sp,
      fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      height: 45,
      child: TextField(
          style: _style.copyWith(color: appBlack),
          controller: widget._controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              prefixText: '${widget.label}- ',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.label,
              labelStyle: _style,
              prefixStyle: _style,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border)),
    );
  }
}
