import 'package:hotels_task/core/errors/failure.dart';
import 'package:hotels_task/features/hotels/domain/entities/hotel.dart';
import 'package:dartz/dartz.dart';

import '../repositories/hotels_repository.dart';

class GetAllHotelsUseCase{
  final HotelsReporsitory reporsitory;
  GetAllHotelsUseCase(this.reporsitory);
  Future<Either<Failure,List<Hotel>>> call ()async{
 return await reporsitory.getAllHotels();
  }

}