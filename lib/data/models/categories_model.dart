// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String? slug;
  String? name;
  String? url;

  CategoryModel({
    this.slug,
    this.name,
    this.url,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
      };
}
