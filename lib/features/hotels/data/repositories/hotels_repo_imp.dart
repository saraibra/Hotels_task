import 'package:dartz/dartz.dart';

import 'package:hotels_task/core/errors/failure.dart';
import 'package:hotels_task/features/hotels/data/datasource/hotels_remote_datasource.dart';

import 'package:hotels_task/features/hotels/domain/entities/hotel.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/hotels_repository.dart';

class HotelsRepositoryImplement implements HotelsReporsitory {
  final HotelsRemoteDataSource hotelsRemoteDataSource;
  final NetworkInfo networkInfo;

  HotelsRepositoryImplement(this.networkInfo, 
       this.hotelsRemoteDataSource);

  @override
  Future<Either<Failure, List<Hotel>>> getAllHotels()  async {
    if (await networkInfo.isConnected) {
      try {
        final allHotels = await hotelsRemoteDataSource.getAllHotels();
        return Right(allHotels);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
           return Left(OfflineFailure());

    }}
}