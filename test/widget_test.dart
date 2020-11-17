import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/models/character_response_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

void main() {
  final _repository = CharacterRepository();
  CharacterResponseModel characterResponseModel;


  test('Getting all the characters', () async{
    final result = await _repository.fetchAllCharacters('character');
    result.fold((l) => null, (r) => characterResponseModel = r);
    expect(characterResponseModel, isA<CharacterResponseModel>());
  });
}
