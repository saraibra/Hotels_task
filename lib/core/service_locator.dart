import 'package:get_it/get_it.dart';
import 'package:hotels_task/core/network/network_info.dart';
import 'package:hotels_task/features/hotels/data/datasource/hotels_remote_datasource.dart';
import 'package:hotels_task/features/hotels/data/repositories/hotels_repo_imp.dart';
import 'package:hotels_task/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:hotels_task/features/hotels/domain/use_cases/get_all_hotels_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/hotels/presentation/bloc/hotel_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //*  features hotel
  // bloc
  sl.registerFactory(() => HotelBloc(getAllHotels: sl()));
  // usecases
  sl.registerLazySingleton<GetAllHotelsUseCase>(
      () => GetAllHotelsUseCase(sl()));
  // datasources
  sl.registerLazySingleton<HotelsRemoteDataSource>(
      () => HotelsRemoteDataSourceImplement(client: sl()));

  // repositories
  sl.registerLazySingleton<HotelsReporsitory>(
      () => HotelsRepositoryImplement(sl(), sl()));

  //* core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
