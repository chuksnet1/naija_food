import 'package:flutter/material.dart';

class Category {
  final String id;
  final String categoryName;
  final String imageurl;

  Category({
    required this.categoryName,
    required this.id,
    required this.imageurl,
  });
}


class CategoryProvider with ChangeNotifier{
final _categoryItem = [
  Category(
    categoryName: 'Meat',
    id: DateTime.now().toString(),
    imageurl:
        'https://www.linkpicture.com/q/cajun-beef-stir-fry-3-735x980.jpeg',
  ),
  Category(
    categoryName: 'Local Dish',
    id: DateTime.now().toString(),
    imageurl:
        'https://www.linkpicture.com/q/nigerian-food-delicious-efo-riro-soup-white-plate-nigerian-food-delicious-efo-riro-soup-white-plate-dining-concept-n-185024627.jpeg',
  ),
  Category(
    categoryName: 'English',
    id: DateTime.now().toString(),
    imageurl:
        'https://www.linkpicture.com/q/istockphoto-1094435394-170667a.jpeg',
  ),
  Category(
    categoryName: 'Pasteries',
    id: DateTime.now().toString(),
    imageurl:
        'https://www.linkpicture.com/q/bread-1284438_340.jpeg',
  ),
];

List <Category> get categoItem{
  return [..._categoryItem] ;
}
}
