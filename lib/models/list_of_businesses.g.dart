// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_businesses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfBusinesses _$ListOfBusinessesFromJson(Map<String, dynamic> json) =>
    ListOfBusinesses(
      businesses: (json['businesses'] as List<dynamic>?)
          ?.map((e) => Business.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListOfBusinessesToJson(ListOfBusinesses instance) =>
    <String, dynamic>{
      'businesses': instance.businesses,
      'total': instance.total,
      'region': instance.region,
    };

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isClosed: json['isClosed'] as bool?,
      url: json['url'] as String?,
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toInt(),
      coordinates: json['coordinates'] == null
          ? null
          : Centre.fromJson(json['coordinates'] as Map<String, dynamic>),
      transactions: json['transactions'] as List<dynamic>?,
      price: json['price'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      displayPhone: json['displayPhone'] as String?,
      distance: (json['distance'] as num).toDouble(),
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isClosed': instance.isClosed,
      'url': instance.url,
      'reviewCount': instance.reviewCount,
      'categories': instance.categories,
      'rating': instance.rating,
      'coordinates': instance.coordinates,
      'transactions': instance.transactions,
      'price': instance.price,
      'location': instance.location,
      'phone': instance.phone,
      'displayPhone': instance.displayPhone,
      'distance': instance.distance,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      businessTempClosed: json['businessTempClosed'],
      menuUrl: json['menuUrl'],
      waitlistReservation: json['waitlistReservation'],
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'businessTempClosed': instance.businessTempClosed,
      'menuUrl': instance.menuUrl,
      'waitlistReservation': instance.waitlistReservation,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      alias: json['alias'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'alias': instance.alias,
      'title': instance.title,
    };

Centre _$CentreFromJson(Map<String, dynamic> json) => Centre(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CentreToJson(Centre instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      address1: json['address1'] as String?,
      address2: json['address2'],
      address3: json['address3'] as String?,
      city: json['city'] as String?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      displayAddress: (json['displayAddress'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'state': instance.state,
      'displayAddress': instance.displayAddress,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      center: json['center'] == null
          ? null
          : Centre.fromJson(json['center'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'center': instance.center,
    };
