import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/models/AppError.dart';
import 'package:rick_and_morty/models/character_response_model.dart';

class CharacterRepository {
  final _dio = Dio(kDioOptions);

  Future<Either<AppError, CharacterResponseModel>> fetchAllCharacters(
      String page) async {
    try {
      final response = await _dio.get(page);
      final model = CharacterResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.response.data['error']));
      } else {
        return Left(AppRepositoryError('Failed to connect to the server'));
      }
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }

  Future<Either<AppError, CharacterResponseModel>> fetchCharactersByName(
      String url) async {
    try {
      final response = await _dio.get(url);
      final model = CharacterResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.response.data['error']));
      } else {
        return Left(AppRepositoryError('Failed to connect to the server'));
      }
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }
}
