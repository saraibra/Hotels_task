import 'package:hotels_task/features/hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  HotelModel(
      {required super.name,
      required super.starts,
      required super.price,
      required super.currency,
      required super.image,
      required super.reviewScore,
      required super.review,
      required super.address});
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      name: json['name'],
      starts: json['starts'],
      price: json['price'],
      image: json['image'],
      currency: json['currency'],
      review: json['review'],
      reviewScore: json['review_score'].toDouble(),
      address: json['address'],
    );
  }
}
