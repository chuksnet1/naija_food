import 'package:flutter/material.dart';

class IntroMovingData {
  final String imageUrl;

  IntroMovingData({ 
    required this.imageUrl,
});
}

class DummyMove with ChangeNotifier{
List<IntroMovingData> Moving_Dummy = [
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/41ca6dfc48714647a813a6c1333a9e94.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/360_F_221241321_PIn6TJUwdqRQjzYfkSPuusn5BdxLHzIX.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/bread-1284438_340.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/cajun-beef-stir-fry-3-735x980.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/istockphoto-830988794-612x612.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/istockphoto-1094435394-170667a.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/nigerian-beans-porridge-1-7.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/nigerian-food-delicious-efo-riro-soup-white-plate-nigerian-food-delicious-efo-riro-soup-white-plate-dining-concept-n-185024627.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/nigerian-food-delicious-efo-riro-soup-white-plate-nigerian-food-delicious-efo-riro-soup-white-plate-dining-concept-n-185024627.jpeg',
  ),
  IntroMovingData(
    imageUrl: 'https://www.linkpicture.com/q/spaghetti-bolognese-black-serving-platter-fresh-basil-parmesan-44237816.jpeg',
  ),
];

}
