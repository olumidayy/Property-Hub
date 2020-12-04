import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  FilterController _typeController = FilterController();
  FilterController _beds = FilterController();
  FilterController _baths = FilterController();
  FilterController _maxRent = FilterController();
  FilterController _furnishing = FilterController();

  _resetFilter(){
    var controllers = [_typeController, _beds, _baths, _maxRent, _furnishing];
    for(var ct in controllers) {
      setState(() {
        ct.index = 0;
        ct.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 25.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 25.sp,
                  icon: Icon(
                    Icons.close,
                    color: appBlack,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomButton(text: 'Reset', onPressed: _resetFilter)
              ],
            ),
            FilterGroup(
              key: UniqueKey(),
              sectionName: 'Property Type',
              controller: _typeController,
              options: ['Any', 'Apartment', 'Duplex'],
            ),
            FilterGroup(
              sectionName: 'Bedrooms',
              controller: _beds,
              options: ['Any', '1', '2', '3', '4+'],
            ),
            FilterGroup(
              sectionName: 'Bathrooms',
              controller: _baths,
              options: ['Any', '1', '2', '3', '4+'],
            ),
            FilterGroup(
              sectionName: 'Maximum Rent',
              controller: _maxRent,
              options: ['₦500,000', '₦1,000,000', '₦1,000,000+'],
            ),
            FilterGroup(
              sectionName: 'Furnishing',
              controller: _furnishing,
              options: ['Any', 'Furnished', 'Unfurnished'],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomButton(text: 'Show Properties')
            ],)
          ]),
        ),
      ),
    );
  }
}

class FilterGroup extends StatefulWidget {
  final FilterController controller;
  final String sectionName;
  final List<String> options;

  const FilterGroup(
      {Key key,
      @required this.controller,
      @required this.sectionName,
      @required this.options})
      : super(key: key);
  @override
  _FilterGroupState createState() => _FilterGroupState();
}

class _FilterGroupState extends State<FilterGroup> {
  // var options = ;
  
  @override
  void initState(){
    widget.controller.index = 0;
    super.initState();
  }

  _setIndex(i) {
    setState(() {
      widget.controller.index = i;
      widget.controller.text = widget.options[widget.controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.sectionName,
            style: TextStyle(
                color: appBlack, fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(children: [
          for (var i = 0; i < widget.options.length; i++)
            InkWell(
              onTap: () => _setIndex(i),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: widget.controller.index == i ? blue : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: widget.controller.index != i
                        ? Border.all(
                            width: 0.5, color: appBlack.withOpacity(0.8))
                        : null,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(widget.options[i],
                      style: TextStyle(
                          color: widget.controller.index == i ? Colors.white : appBlack)),
                  alignment: Alignment.center),
            )
        ])
      ],
    );
  }
}

class FilterController {
  String text;
  int index;

  FilterController({Key key, this.text, this.index=0});

}
