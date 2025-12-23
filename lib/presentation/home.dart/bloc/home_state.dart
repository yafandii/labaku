part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus productStatus;
  final List<Product> products;
  final List<String> banners;
  final List<CategoryModel> categories;
  final int curentIndexCarousel;
  final int selectedCategory;

  const HomeState({
    this.productStatus = FormzSubmissionStatus.initial,
    this.products = const [],
    this.banners = const [],
    this.categories = const [],
    this.curentIndexCarousel = 0,
    this.selectedCategory = 0,
  });

  HomeState copyWith({
    FormzSubmissionStatus? productStatus,
    List<Product>? products,
    List<String>? banners,
    List<CategoryModel>? categories,
    int? curentIndexCarousel,
    int? selectedCategory,
  }) =>
      HomeState(
        productStatus: productStatus ?? this.productStatus,
        products: products ?? this.products,
        banners: banners ?? this.banners,
        categories: categories ?? this.categories,
        curentIndexCarousel: curentIndexCarousel ?? this.curentIndexCarousel,
        selectedCategory: selectedCategory ?? this.selectedCategory,
      );

  @override
  List<Object?> get props => [
        productStatus,
        products,
        banners,
        categories,
        curentIndexCarousel,
        selectedCategory,
      ];
}
