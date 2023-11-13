part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetAllHotelsEvent extends HotelEvent {}
class UpdatePricesEvent extends HotelEvent {
  final int value;
  UpdatePricesEvent(this.value);
}

class FilterHotelsEvent extends HotelEvent {}
class SortHotelsEvent extends HotelEvent {

  final int index;

  SortHotelsEvent(this.index);
}
