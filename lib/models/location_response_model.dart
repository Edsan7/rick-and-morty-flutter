import 'dart:convert';
import 'package:rick_and_morty/models/location_model.dart';

class LocationResponseModel {
  final LocationResponseInfo info;
  final List<LocationModel> locationsList;

  const LocationResponseModel({
    this.info,
    this.locationsList,
  });

  factory LocationResponseModel.fromJson(String str) =>
      LocationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationResponseModel.fromMap(Map<String, dynamic> json) =>
      LocationResponseModel(
        info: LocationResponseInfo.fromMap(json["info"]),
        locationsList: List<LocationModel>.from(
            json["results"].map((x) => LocationModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(locationsList.map((x) => x.toMap())),
      };
}

class LocationResponseInfo {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  const LocationResponseInfo({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory LocationResponseInfo.fromJson(String str) =>
      LocationResponseInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationResponseInfo.fromMap(Map<String, dynamic> json) =>
      LocationResponseInfo(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
