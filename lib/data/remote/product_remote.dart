import 'package:labaku/data/models/categories_model.dart';
import 'package:labaku/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';

import 'package:retrofit/http.dart';

part 'product_remote.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class ProductRemote {
  factory ProductRemote(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _ProductRemote;

  @GET('/products')
  Future<ProductsModels> getProducts();

  @GET('/products/categories')
  Future<List<CategoryModel>> getCategories();
}
