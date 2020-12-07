import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_hub/core/constants/colors.dart';
import 'package:property_hub/ui/views/explore_view/explore_viewmodel.dart';
import 'package:property_hub/ui/views/filter_view/filter_view.dart';
import 'package:property_hub/ui/views/saved_properties/saved_properties_viewmodel.dart';
import 'package:property_hub/ui/widgets/property_card.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:provider/provider.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);

    final states = [
      'Abia',
      'Abuja',
      'Adamawa',
      'Akwa Ibom',
      'Anambra',
      'Bayelsa',
      'Benue',
      'Borno',
      'Crossriver',
      'Delta',
      'Ebonyi',
      'Edo',
      'Ekiti',
      'Enugu',
      'Gombe',
      'Imo',
      'Jigawa',
      'Kaduna',
      'Kano',
      'Katsina',
      'Kebbi',
      'Kogi',
      'Kwara',
      'Lagos',
      'Nassarawa',
      'Niger',
      'Ogun',
      'Ondo',
      'Osun',
      'Oyo',
      'Plateau',
      'Rivers',
      'Sokoto',
      'Taraba',
      'Yobe',
      'Zamfara'
    ];

    var model = context.watch<ExploreViewModel>();
    
    var savedModel = context.watch<SavedPropertiesViewModel>();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List data = snapshot.data;
          print(data);
          return SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 40.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 23.h),
                  height: 38.h > 35 ? 35 : 38.h,
                  width: 276.w,
                  child: SimpleAutoCompleteTextField(
                    suggestions: states,
                    key: GlobalKey(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                        hintText: 'Where do you want to live?',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(100.sp)),
                        filled: true,
                        fillColor: Color(0xFFD9D9D9)),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FilterView())),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10.w),
                    padding: EdgeInsets.all(6.25.sp),
                    child: SvgPicture.asset('assets/filter.svg'),
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Row(
                  children: [
                    Text('Suggestions for you',
                        style: TextStyle(
                          color: purple,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Column(
                  children: data
                      .map(
                        (i) => PropertyCard(
                          onTap: () async  {
                            savedModel.addProperty(i);
                          },//await model.toggleSaved(i.id),
                            imgUrl: 'https://images.nigeriapropertycentre.com/properties/images/462672/05f359c86279e5-westbury-homes-buy-now-and-build-c-of-o-residential-land-for-sale-bogije-lekki-ibeju-lagos.jpeg',
                            price: i.price != null ? (i.price).toString() : '1,000,000',
                            location: i.location,
                            noofBedrooms: i.bedrooms,
                            noofBathrooms: i.bathrooms,
                            nooflivingrooms: i.lounges),
                      )
                      .toList())
              // PropertyCard(
              //     assetName: assetName,
              //     price: price,
              //     location: location,
              //     noofBedrooms: noofBedrooms,
              //     noofBathrooms: noofBathrooms,
              //     nooflivingrooms: nooflivingrooms),
              // PropertyCard(
              //     assetName: 'prop1.jpg',
              //     price: '1,000,000',
              //     location: 'Gwarimpa, Abuja.',
              //     noofBedrooms: 5,
              //     noofBathrooms: 6,
              //     nooflivingrooms: 2),
              // PropertyCard(
              //     assetName: 'prop2.jpg',
              //     price: price,
              //     location: location,
              //     noofBedrooms: noofBedrooms,
              //     noofBathrooms: noofBathrooms,
              //     nooflivingrooms: nooflivingrooms),
              // PropertyCard(
              //     assetName: 'prop3.png',
              //     price: '750,000',
              //     location: 'Lekki, Lagos.',
              //     noofBedrooms: noofBedrooms,
              //     noofBathrooms: noofBathrooms,
              //     nooflivingrooms: nooflivingrooms),
            ]),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
      future: model.listings,
    );
  }
}
