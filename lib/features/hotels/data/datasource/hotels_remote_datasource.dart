
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hotels_task/features/hotels/data/models/hotel_model.dart';

import '../../../../core/errors/exception.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> getAllHotels();
}
class HotelsRemoteDataSourceImplement implements HotelsRemoteDataSource {
      final http.Client client;

  HotelsRemoteDataSourceImplement({required this.client});

  @override
  Future<List<HotelModel>> getAllHotels() async {
    final response = await client.get(Uri.parse('https://www.hotelsgo.co/test/hotels'),
       );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<HotelModel> hotelsModels = decodedJson
          .map<HotelModel>((hotelModel) => HotelModel.fromJson(hotelModel))
          .toList();
          return hotelsModels;
    } else {
      throw ServerException();
    }
  }
}