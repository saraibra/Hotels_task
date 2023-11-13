import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  String name;
  int starts;
  int price;
  String currency;
  String image;
  double reviewScore;
  String review;
  String address;
  Hotel({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
