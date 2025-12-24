import 'package:labaku/data/models/categories_model.dart';
import 'package:labaku/data/models/product_model.dart';
import 'package:labaku/data/remote/product_remote.dart';
import 'package:labaku/domain/network/error_handler.dart';
import 'package:labaku/domain/network/failure.dart';
import 'package:labaku/domain/repository/product_repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ProductRemote _productRemote;

  ProductRepositoryImpl(this._productRemote);

  @override
  Future<Either<Failure, ProductsModels>> getProducts() async {
    try {
      final result = await _productRemote.getProducts();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final result = await _productRemote.getCategories();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
