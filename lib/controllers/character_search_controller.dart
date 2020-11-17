import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/models/AppError.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/models/character_response_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

class CharacterResultSearchController {
  final _repository = CharacterRepository();

  CharacterResponseModel characterResponseModel;
  AppError appError;

  int actualPage = 1;

  int get totalPages => characterResponseModel.info.pages ?? 0;
  int get itemCount => characters.length ?? 0;
  int get totalResults => characterResponseModel.info.count;
  String get nextPage =>
      characterResponseModel.info.next?.substring(32, 55) ?? '';
  String get previousPage =>
      characterResponseModel.info.prev?.substring(32, 55) ?? '';
  List<CharacterModel> get characters =>
      characterResponseModel?.charactersList ?? <CharacterModel>[];
  
  Future fetchCharacterByName(String searchName,
      {String searchUrl = kInitialSearch}) async {
    final result =
        await _repository.fetchCharactersByName(searchUrl + searchName);
    result.fold((l) => appError = l, (r) => characterResponseModel = r);
  }
}
