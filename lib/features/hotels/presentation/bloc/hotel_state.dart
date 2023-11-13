part of 'hotel_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelsState {}

class LoadingHotelsState extends HotelsState {}

class LoadedHotelsState extends HotelsState {
  final List<Hotel> allHotels;

  LoadedHotelsState({required this.allHotels});

  @override
  List<Object> get props => [allHotels];
}

class ErrorHotelsState extends HotelsState {
  final String message;

  ErrorHotelsState(this.message);
}

class LoadingFilteredHotelsState extends HotelsState {}

class LoadedFilteredHotelsState extends HotelsState {
  final List<Hotel> allHotels;

  LoadedFilteredHotelsState({required this.allHotels});

  @override
  List<Object> get props => [allHotels];
}

class ErrorFilteredHotelsState extends HotelsState {
  final String message;

  ErrorFilteredHotelsState(this.message);
}

class UpdatePriceState extends HotelsState {}
class LoadingSortedHotelsState extends HotelsState {}

class LoadedSortedHotelsState extends HotelsState {
  final List<Hotel> allHotels;

  LoadedSortedHotelsState({required this.allHotels});

  @override
  List<Object> get props => [allHotels];
}

class ErrorSortedHotelsState extends HotelsState {
  final String message;

  ErrorSortedHotelsState(this.message);
}
