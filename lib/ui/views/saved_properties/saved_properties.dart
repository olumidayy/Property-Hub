import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/views/saved_properties/saved_properties_viewmodel.dart';
import 'package:property_hub/ui/widgets/custom_button.dart';
import 'package:property_hub/ui/widgets/property_card.dart';

import 'package:provider/provider.dart';

class SavedProperties extends StatefulWidget {
  final VoidCallback onPressed;

  const SavedProperties({Key key, this.onPressed}) : super(key: key);

  @override
  _SavedPropertiesState createState() => _SavedPropertiesState();
}

class _SavedPropertiesState extends State<SavedProperties> {

  @override
  Widget build(BuildContext context) {
  // var isEmpty = true;
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    
    var model = context.watch<SavedPropertiesViewModel>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Saved Properties',
              style: TextStyle(color: purple, fontSize: 25.sp)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: model.savedProperties.isEmpty ? Padding(
            padding: EdgeInsets.all(25.sp),
            child: Container(
              width: 232.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('You don\'t have any saved properties yet..', style: TextStyle(color: appBlack, fontSize: 17.sp)),
                SizedBox(height: 25.h),
                Text(
                    'When you see a property you want to save just click the heart icon', style: TextStyle(color: appBlack, fontSize: 17.sp)),
                SizedBox(height: 11.h),
                CustomButton(
                  text: 'Start Exploring',
                  onPressed: widget.onPressed,
                )
              ]),
            ),
          ) : Center(
            child: Column(
              children: [
                for(var i = 0; i < model.savedProperties.length; i++)
                
                PropertyCard(
                  isSaved: true,
                  imgUrl: 'https://images.nigeriapropertycentre.com/properties/images/462672/05f359c86279e5-westbury-homes-buy-now-and-build-c-of-o-residential-land-for-sale-bogije-lekki-ibeju-lagos.jpeg',
                  location: model.savedProperties[i].location,
                  noofBathrooms: model.savedProperties[i].bathrooms,
                  noofBedrooms: model.savedProperties[i].bedrooms,
                  price: model.savedProperties[i].price != null ? (model.savedProperties[i].price).toString() : '1,000,000',
                  nooflivingrooms: model.savedProperties[i].lounges,
                  onTap: () {
                    model.removePropertyAt(i);
                    print(model.savedProperties);
                  },
                )
              ]
            ),
          ),
        ));
  }
}
