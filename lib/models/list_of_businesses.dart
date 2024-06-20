import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'list_of_businesses.g.dart';

// De-serialize the JSON object returned by the yelp API into
// an object that has a list of businesses as an attribute
// that can then be passed into a list.

@JsonSerializable()
class ListOfBusinesses {
  List<Business>? businesses = [];
  int? total;
  Region? region;

  ListOfBusinesses({
    this.businesses,
    this.total,
    this.region,
  });

  factory ListOfBusinesses.fromRawJson(String str) =>
      ListOfBusinesses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListOfBusinesses.fromJson(Map<String, dynamic> json) =>
      _$ListOfBusinessesFromJson(json);
  Map<String, dynamic> toJson() => _$ListOfBusinessesToJson(this);
}

@JsonSerializable()
class Business {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Category>? categories;
  int? rating;
  Centre? coordinates;
  List<dynamic>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double distance;
  Attributes? attributes;

  Business({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    required this.distance,
    this.attributes,
  });

  factory Business.fromRawJson(String str) =>
      Business.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}

@JsonSerializable()
class Attributes {
  dynamic businessTempClosed;
  dynamic menuUrl;
  dynamic waitlistReservation;

  Attributes({
    this.businessTempClosed,
    this.menuUrl,
    this.waitlistReservation,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable()
class Category {
  String? alias;
  String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Centre {
  double? latitude;
  double? longitude;

  Centre({
    this.latitude,
    this.longitude,
  });

  factory Centre.fromRawJson(String str) => Centre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Centre.fromJson(Map<String, dynamic> json) => _$CentreFromJson(json);
  Map<String, dynamic> toJson() => _$CentreToJson(this);
}

@JsonSerializable()
class Location {
  String? address1;
  dynamic address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Region {
  Centre? center;

  Region({
    this.center,
  });

  factory Region.fromRawJson(String str) => Region.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
