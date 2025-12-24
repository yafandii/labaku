import 'package:labaku/data/models/categories_model.dart';
import 'package:labaku/data/models/product_model.dart';
import 'package:labaku/domain/network/failure.dart';
import 'package:labaku/domain/repository/product_repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUsecases {
  final ProductRepository _repository;
  ProductUsecases(this._repository);

  Future<Either<Failure, ProductsModels>> getProducts() async =>
      await _repository.getProducts();

  Future<Either<Failure, List<CategoryModel>>> getCategories() async =>
      await _repository.getCategories();
}
