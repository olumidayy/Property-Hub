import 'package:flutter/cupertino.dart';

class Listing {
  String id;
  String location;
  String description;
  int bathrooms;
  int bedrooms;
  int lounges;
  int price;
  bool isFurnished;
  List<String> imageUrls;

  Listing({
    @required this.location,
    @required this.description,
    @required this.bedrooms,
    @required this.bathrooms,
    @required this.price,
    @required this.isFurnished,
    @required this.lounges,
    @required this.id,
    @required this.imageUrls,
  });

  factory Listing.fromMap(Map<String, dynamic> data) {
    return Listing(
      id: data['id'],
      lounges: data['lounges'] ?? 1,
      location: data['location'],
      description: data['description'],
      bedrooms: data['bedrooms'],
      bathrooms: data['bathrooms'],
      price: data['price'],
      isFurnished: data['is_furnished'],
      imageUrls: data['listing_images'].map((e) => e['image_url']).toList(),
    );
  }
}
