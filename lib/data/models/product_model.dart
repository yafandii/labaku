// To parse this JSON data, do
//
//     final productsModels = productsModelsFromJson(jsonString);

import 'dart:convert';

ProductsModels productsModelsFromJson(String str) =>
    ProductsModels.fromJson(json.decode(str));

String productsModelsToJson(ProductsModels data) => json.encode(data.toJson());

class ProductsModels {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsModels({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsModels.fromJson(Map<String, dynamic> json) => ProductsModels(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from((products ?? []).map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  int? id;
  String? title;
  String? description;
  Category? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  AvailabilityStatus? availabilityStatus;
  List<Review>? reviews;
  ReturnPolicy? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: categoryValues.map[json["category"]],
        price: json["price"].toDouble(),
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus:
            availabilityStatusValues.map[json["availabilityStatus"]],
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: returnPolicyValues.map[json["returnPolicy"]],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromJson(json["meta"]),
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": categoryValues.reverse[category],
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from((tags ?? []).map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus":
            availabilityStatusValues.reverse[availabilityStatus],
        "reviews": List<dynamic>.from((reviews ?? []).map((x) => x.toJson())),
        "returnPolicy": returnPolicyValues.reverse[returnPolicy],
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": List<dynamic>.from((images ?? []).map((x) => x)),
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus { inStock, lowStock }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.inStock,
  "Low Stock": AvailabilityStatus.lowStock
});

enum Category { beauty, fragrances, furniture, groceries }

final categoryValues = EnumValues({
  "beauty": Category.beauty,
  "fragrances": Category.fragrances,
  "furniture": Category.furniture,
  "groceries": Category.groceries
});

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"].toDouble(),
        height: json["height"].toDouble(),
        depth: json["depth"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

enum ReturnPolicy {
  noreturnpolicy,
  the30daysreturnpolicy,
  the60daysreturnpolicy,
  the7daysreturnpolicy,
  the90daysreturnpolicy
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.noreturnpolicy,
  "30 days return policy": ReturnPolicy.the30daysreturnpolicy,
  "60 days return policy": ReturnPolicy.the60daysreturnpolicy,
  "7 days return policy": ReturnPolicy.the7daysreturnpolicy,
  "90 days return policy": ReturnPolicy.the90daysreturnpolicy
});

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
