import 'package:flutter/foundation.dart';

class MealModel {
  String name;
  String imageURL;
  String description;
  String rate;
  String time;

  MealModel({
    required this.name,
    required this.imageURL,
    required this.description,
    required this.rate,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageURL': imageURL,
      'description': description,
      'rate': rate,
      'time': time
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      name: map['name'],
      imageURL: map['imageURL'],
      description: map['description'],
      rate: map['rate'],
      time: map['time'],
    );
  }
}
