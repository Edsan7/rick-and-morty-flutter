import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/models/AppError.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/models/character_response_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

class CharactersController {
  final _repository = CharacterRepository();

  CharacterResponseModel characterResponseModel;
  AppError appError;

  int actualPage = 1;
  String searchName;

  List<CharacterModel> get characters =>
      characterResponseModel?.charactersList ?? [];

  int get totalPages => characterResponseModel.info.pages ?? 0;
  int get itemCount => characters.length ?? 0;
  String get nextPage => characterResponseModel.info.next?.substring(31) ?? '';
  String get previousPage =>
      characterResponseModel.info.prev?.substring(31) ?? '';

  void setSearchName(String value) => searchName = value;

  Future fetchAllCharacters({String page = kInitialPage}) async {
    final result = await _repository.fetchAllCharacters(page);
    result.fold((l) => appError = l, (r) => characterResponseModel = r);
  }
}
