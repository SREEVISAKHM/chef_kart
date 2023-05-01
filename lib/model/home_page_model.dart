// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  final List<Dish> dishes;
  final List<PopularDish> popularDishes;

  HomePageModel({
    required this.dishes,
    required this.popularDishes,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
        popularDishes: List<PopularDish>.from(
            json["popularDishes"].map((x) => PopularDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
        "popularDishes":
            List<dynamic>.from(popularDishes.map((x) => x.toJson())),
      };
}

class Dish {
  final String name;
  final double rating;
  final String description;
  final List<String> equipments;
  final String image;
  final int id;

  Dish({
    required this.name,
    required this.rating,
    required this.description,
    required this.equipments,
    required this.image,
    required this.id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        description: json["description"],
        equipments: List<String>.from(json["equipments"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "description": description,
        "equipments": List<dynamic>.from(equipments.map((x) => x)),
        "image": image,
        "id": id,
      };
}

class PopularDish {
  final String name;
  final String image;
  final int id;

  PopularDish({
    required this.name,
    required this.image,
    required this.id,
  });

  factory PopularDish.fromJson(Map<String, dynamic> json) => PopularDish(
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
      };
}
