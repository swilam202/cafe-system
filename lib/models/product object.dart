import 'package:flutter/material.dart';

abstract class Product {
  late int id;
  late String name;
  late String ingredients;
  late String description;
  late double price;
  late int duration;
  late Image image;

  String type();

  String amount();
}

class Drink extends Product {
  late int size;

  @override
  String type() => 'Drinks';

  @override
  String amount() => '$size ml';
}

class Meal extends Product {
  late int weight;

  @override
  String type() => 'Meal';

  @override
  String amount() => '$weight ml';
}
