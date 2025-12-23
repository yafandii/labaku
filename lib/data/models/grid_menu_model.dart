// To parse this JSON data, do
//
//     final gridMenuModel = gridMenuModelFromJson(jsonString);

import 'dart:convert';

GridMenuModel gridMenuModelFromJson(String str) =>
    GridMenuModel.fromJson(json.decode(str));

String gridMenuModelToJson(GridMenuModel data) => json.encode(data.toJson());

class GridMenuModel {
  String? icon;
  String? title;

  GridMenuModel({
    this.icon,
    this.title,
  });

  factory GridMenuModel.fromJson(Map<String, dynamic> json) => GridMenuModel(
        icon: json["icon"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
      };
}
