import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/models/AppError.dart';
import 'package:rick_and_morty/models/location_model.dart';

class LocationRepository {
  final _dio = Dio(kDioOptions);

  Future<Either<AppError, LocationModel>> fetchLocation(
      String path) async {
    try {
      final response = await _dio.get(path);
      final model = LocationModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.response.data['error']));
      } else {
        return Left(AppRepositoryError('Failed to connect to the Server.'));
      }
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }
}
