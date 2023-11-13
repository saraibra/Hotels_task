import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/hotel.dart';

abstract class HotelsReporsitory{
 Future<Either<Failure,List<Hotel>>> getAllHotels();

}  
