import 'package:boilerplate/data/models/categories_model.dart';
import 'package:boilerplate/data/models/product_model.dart';
import 'package:boilerplate/domain/network/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsModels>> getProducts();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
