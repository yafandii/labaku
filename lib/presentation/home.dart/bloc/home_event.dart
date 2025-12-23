part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class GetProductsEvent extends HomeEvent {}

class CarouselIndexChangeEvent extends HomeEvent {
  final int index;
  CarouselIndexChangeEvent(this.index);
}

class LoadImageBannerEvent extends HomeEvent {}

class SelectedCategoriesCHangeEvent extends HomeEvent {
  final int index;
  SelectedCategoriesCHangeEvent(this.index);
}
