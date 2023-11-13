import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotels_task/core/resources/color_manager.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/resources/string_manager.dart';
import '../../domain/entities/hotel.dart';
import '../../domain/use_cases/get_all_hotels_usecase.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelsState> {
  final GetAllHotelsUseCase getAllHotels;

  List<Hotel> hotelsList = [];
  TextEditingController searchController = TextEditingController();

  HotelBloc({
    required this.getAllHotels,
  }) : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      if (event is GetAllHotelsEvent) {
        emit(LoadingHotelsState());

        final Either<Failure, List<Hotel>> allHotels = await getAllHotels();
        emit(_mapFailureOrHotelsToState(allHotels));
      } else if (event is SortHotelsEvent) {
        emit(LoadingSortedHotelsState());
        sortData(event.index);
        emit(LoadedSortedHotelsState(allHotels: hotelsList));
      } else if (event is FilterHotelsEvent) {
        emit(LoadingFilteredHotelsState());

        emit(LoadedFilteredHotelsState(allHotels: filterHotels()));
      }
      else if(event is UpdatePricesEvent){
    maxPrice = event.value;
    emit(UpdatePriceState());
  

      }
    });
  }
  HotelsState _mapFailureOrHotelsToState(Either<Failure, List<Hotel>> either) {
    return either
        .fold((failure) => ErrorHotelsState(getFailureErrorMessage(failure)),
            (hotels) {
      hotels.forEach((element) {
        hotelsList.add(element);
      });
      return LoadedHotelsState(allHotels: hotels);
    });
  }

  String getFailureErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverError;
      case EmptyCasheFailure:
        return AppStrings.cashError;
      case OfflineFailure:
        return AppStrings.offlineErrpr;
      default:
        return AppStrings.unexpectedError;
    }
  }

  int minPrice = 20;
  int maxPrice = 540;
  int starsCount = 4;
  int selectedIndex = 0;
  double reviewScore = 5;
  
  List ratingList = [
    {'score': '0+', 'Color': ColorManager.error},
    {'score': '7+', 'Color': ColorManager.orange},
    {'score': '7.5+', 'Color': ColorManager.lightGreen},
    {'score': '8+', 'Color': ColorManager.mediumGreen},
    {'score': '8.5+', 'Color': ColorManager.darkGreen},
  ];
  getSelctedReviewScore(int index) {
    String result = ratingList[index]['score'];

//int score  =
    String score = result.substring(0, result.indexOf('+'));
    reviewScore = double.parse(score);
  }
getStarsNumber(int index){
  starsCount = index;
}
  List<Hotel> filterHotels() {
    print(starsCount);
    List<Hotel> filteredList = hotelsList
        .where((hotel) =>
            hotel.price >= minPrice &&
            hotel.price <= maxPrice &&
            hotel.starts >= starsCount &&
            hotel.reviewScore >= reviewScore)
        .toList();
    return filteredList;
  }

  sortData(int index) {
    
    Map<String, Function> functionMap = {
      'Our recommendations': () =>
          hotelsList.sort((a, b) => b.reviewScore.compareTo(a.reviewScore)),
      'Rating only': () =>
          hotelsList.sort((a, b) => b.starts.compareTo(a.starts)),
      'Price only': () => hotelsList.sort((a, b) => b.price.compareTo(a.price)),
      'Price & Recommended': () {
        hotelsList.sort((a, b) {
          if (a.price != b.price) {
            return b.price.compareTo(a.price);
          } else {
            return b.reviewScore.compareTo(a.reviewScore);
          }
        });
      },
      'Rating & Recommended': () {
        hotelsList.sort((a, b) {
          if (a.starts != b.starts) {
            return b.starts.compareTo(a.starts);
          } else {
            return b.reviewScore.compareTo(a.reviewScore);
          }
        });
      }
    };

    if(functionMap.containsKey(sortList[index])){
      functionMap[sortList[index]]!();
    }
  }

  
  

  List<String> sortList = [
    'Our recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only ',
    'Distance only'
  ];
}
