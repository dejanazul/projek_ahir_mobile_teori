import 'package:json_annotation/json_annotation.dart';
part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  final String name;
  final String url;
  final List<ImageModel> images;
  final List<ClassificationsModel> classifications;
  final Dates dates;
  @JsonKey(defaultValue: [])
  final List<PriceRangesModel> priceRanges;

  TicketModel({
    required this.name,
    required this.url,
    required this.images,
    required this.classifications,
    required this.dates,
    required this.priceRanges,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}

@JsonSerializable()
class PriceRangesModel {
  final String type;
  final String currency;
  final double min;
  final double max;

  PriceRangesModel(
      {required this.currency, required this.min, required this.max, required this.type});

  factory PriceRangesModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceRangesModelToJson(this);
}

@JsonSerializable()
class Dates {
  final Start start;

  Dates({required this.start});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
  Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable()
class Start {
  final String localDate;
  final String localTime;

  Start({required this.localDate, required this.localTime});
  factory Start.fromJson(Map<String, dynamic> json) => _$StartFromJson(json);
  Map<String, dynamic> toJson() => _$StartToJson(this);
}

@JsonSerializable()
class ClassificationsModel {
  final Genre genre;

  ClassificationsModel({required this.genre});

  factory ClassificationsModel.fromJson(Map<String, dynamic> json) =>
      _$ClassificationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClassificationsModelToJson(this);
}

@JsonSerializable()
class Genre {
  final String name;

  Genre({required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ImageModel {
  final String url;

  ImageModel({required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
