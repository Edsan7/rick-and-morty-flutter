import 'dart:convert';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterResponseModel {
  final CharacterResponseInfo info;
  final List<CharacterModel> charactersList;

  const CharacterResponseModel({
    this.info,
    this.charactersList,
  });

  factory CharacterResponseModel.fromJson(String str) =>
      CharacterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterResponseModel.fromMap(Map<String, dynamic> json) =>
      CharacterResponseModel(
        info: CharacterResponseInfo.fromMap(json["info"]),
        charactersList: List<CharacterModel>.from(
            json["results"].map((x) => CharacterModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(charactersList.map((x) => x.toMap())),
      };
}

class CharacterResponseInfo {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  const CharacterResponseInfo({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory CharacterResponseInfo.fromJson(String str) =>
      CharacterResponseInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterResponseInfo.fromMap(Map<String, dynamic> json) =>
      CharacterResponseInfo(
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
