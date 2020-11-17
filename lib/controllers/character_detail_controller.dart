import 'package:rick_and_morty/models/AppError.dart';
import 'package:rick_and_morty/models/location_model.dart';
import 'package:rick_and_morty/repository/location_repository.dart';

class CharacterDetailController {
  final _repository = LocationRepository();

  LocationModel location;
  AppError appError;
  bool isLoading = true;

  Future fetchLocation(String urlLocation) async {
    final result = await _repository.fetchLocation(urlLocation);
    result.fold((l) => appError = l, (r) => location = r);
  }
}
