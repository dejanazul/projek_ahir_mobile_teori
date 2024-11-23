// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      name: json['name'] as String,
      url: json['url'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      classifications: (json['classifications'] as List<dynamic>)
          .map((e) => ClassificationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: Dates.fromJson(json['dates'] as Map<String, dynamic>),
      priceRanges: (json['priceRanges'] as List<dynamic>?)
              ?.map((e) => PriceRangesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'images': instance.images,
      'classifications': instance.classifications,
      'dates': instance.dates,
      'priceRanges': instance.priceRanges,
    };

PriceRangesModel _$PriceRangesModelFromJson(Map<String, dynamic> json) =>
    PriceRangesModel(
      currency: json['currency'] as String,
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$PriceRangesModelToJson(PriceRangesModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'currency': instance.currency,
      'min': instance.min,
      'max': instance.max,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      start: Start.fromJson(json['start'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'start': instance.start,
    };

Start _$StartFromJson(Map<String, dynamic> json) => Start(
      localDate: json['localDate'] as String,
      localTime: json['localTime'] as String,
    );

Map<String, dynamic> _$StartToJson(Start instance) => <String, dynamic>{
      'localDate': instance.localDate,
      'localTime': instance.localTime,
    };

ClassificationsModel _$ClassificationsModelFromJson(
        Map<String, dynamic> json) =>
    ClassificationsModel(
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassificationsModelToJson(
        ClassificationsModel instance) =>
    <String, dynamic>{
      'genre': instance.genre,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'name': instance.name,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
