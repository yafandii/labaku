import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:labaku/data/constant/app_assets.dart';
import 'package:labaku/data/models/categories_model.dart';
import 'package:labaku/data/models/product_model.dart';
import 'package:labaku/domain/usecases/product_usecases/product_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUsecases productUsecases;

  HomeBloc(this.productUsecases) : super(const HomeState()) {
    on<HomeInitialEvent>(_onInit);
    on<GetProductsEvent>(_getProducts);
    on<CarouselIndexChangeEvent>(_onCarouselIndexChange);
    on<LoadImageBannerEvent>(_onLoadBanner);
    on<SelectedCategoriesCHangeEvent>(_onSelectedCategoriesChange);
  }

  FutureOr<void> _onInit(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    final result = await productUsecases.getCategories();
    result.fold(
        (l) =>
            emit(state.copyWith(productStatus: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(categories: r)));

    add(LoadImageBannerEvent());
    add(GetProductsEvent());
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(productStatus: FormzSubmissionStatus.inProgress));
    final result = await productUsecases.getProducts();
    result.fold(
        (l) =>
            emit(state.copyWith(productStatus: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(
            productStatus: FormzSubmissionStatus.success,
            products: r.products)));
  }

  FutureOr<void> _onCarouselIndexChange(
      CarouselIndexChangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(curentIndexCarousel: event.index));
  }

  FutureOr<void> _onLoadBanner(
      LoadImageBannerEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(banners: [
      AppAssets.banner1,
      AppAssets.banner2,
      AppAssets.banner3,
    ]));
  }

  FutureOr<void> _onSelectedCategoriesChange(
      SelectedCategoriesCHangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedCategory: event.index));
  }
}
