import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final String id;
  final String prodName;
  final String price;
  final String category;
  DateTime date = DateTime.now();
  bool isFavourite;
  final String imageUrl;

  Product({
    required this.category,
    required this.price,
    required this.prodName,
    required this.id,
    required this.imageUrl,
    this.isFavourite = false,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> _ProductItem = [
    /* Product(
      category: 'English',
      price: '1200',
      prodName: 'Rice and Plantain',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/41ca6dfc48714647a813a6c1333a9e94.jpeg',
    ),
    Product(
      category: 'Meat',
      price: '2400',
      prodName: 'smoked Meat',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/360_F_221241321_PIn6TJUwdqRQjzYfkSPuusn5BdxLHzIX.jpeg',
    ),
    Product(
      category: 'Pasteries',
      price: '560',
      prodName: 'Roll bead',
      id: DateTime.now().toString(),
      imageUrl: 'https://www.linkpicture.com/q/bread-1284438_340.jpeg',
    ),
    Product(
      category: 'Meat',
      price: '1320',
      prodName: 'Spiced Meat',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/cajun-beef-stir-fry-3-735x980.jpeg',
    ),
    Product(
      category: 'Meat',
      price: '920',
      prodName: 'Fried Meat',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/istockphoto-830988794-612x612.jpeg',
    ),
    Product(
      category: 'English',
      price: '1830',
      prodName: 'Rice',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/istockphoto-1094435394-170667a.jpeg',
    ),
    Product(
      category: 'English',
      price: '970',
      prodName: 'Beans',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/nigerian-beans-porridge-1-7.jpeg',
    ),
    Product(
      category: 'Local Dish',
      price: '1430',
      prodName: 'Vegetable Soup',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/nigerian-food-delicious-efo-riro-soup-white-plate-nigerian-food-delicious-efo-riro-soup-white-plate-dining-concept-n-185024627.jpeg',
    ),
    Product(
      category: 'Local Dish',
      price: '1251',
      prodName: 'Oha Soup',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/nigerian-food-delicious-efo-riro-soup-white-plate-nigerian-food-delicious-efo-riro-soup-white-plate-dining-concept-n-185024627.jpeg',
    ),
    Product(
      category: 'English',
      price: '2310',
      prodName: 'Spagheti',
      id: DateTime.now().toString(),
      imageUrl:
          'https://www.linkpicture.com/q/spaghetti-bolognese-black-serving-platter-fresh-basil-parmesan-44237816.jpeg',
    ),*/
  ];

  List<Product> get ProductItem {
    return [..._ProductItem];
  }

//Fetch Data from Server
  Future<void> fetchData() async {
    final url = Uri.https(
        'naijasoup-70b95-default-rtdb.firebaseio.com', '/foodprod.json');
    try {
      final response = await http.get(url);
      final List<Product> LoadedFood = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((prodId, prodData) {
        LoadedFood.add(
          Product(
            //Product here is the type of data we are getting
            category: prodData['category'],
            price: prodData['price'],
            prodName: prodData['title'],
            id: prodId,
            imageUrl: prodData['imageUrl'],
            isFavourite: prodData['isFavourite'],
          ),
        );
      });
      _ProductItem = LoadedFood;
      //print(json.decode(response.body));    ---to check the kind data we have
    } catch (error) {
      throw (error);
    }
  }

//To Add new product to list ProductItem
//this code add data to list on the server
  Future<void> addProduct(Product foodProduct) async {
    final url = Uri.https(
        'naijasoup-70b95-default-rtdb.firebaseio.com', '/foodprod.json');
    try {
      await http.post(
        url,
        body: json.encode({
          'title': foodProduct.prodName,
          'category': foodProduct.category,
          'price': foodProduct.price,
          'imageUrl': foodProduct.imageUrl,
          'isFavourite': foodProduct.isFavourite
        }),
      );

      // print(json.decode(response.body));
      //this code add data to list
      final newProduct = Product(
        category: foodProduct.category,
        price: foodProduct.price,
        prodName: foodProduct.prodName,
        id: foodProduct.id,
        imageUrl: foodProduct.imageUrl,
      );
      _ProductItem.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

//To update existing value of the product item
  Future<void> updateProduct(String prodId, Product newEditedProd) async {
    final editProdIndex = _ProductItem.indexWhere((e) => e.id == prodId);
    if (editProdIndex >= 0) {
      final url = Uri.https('naijasoup-70b95-default-rtdb.firebaseio.com',
          '/foodprod/$prodId.json');
      await http.patch(url,
          body: json.encode({
            'title': newEditedProd.prodName,
            'category': newEditedProd.category,
            'price': newEditedProd.price,
            'imageUrl': newEditedProd.imageUrl,
            'isFavourite': newEditedProd.isFavourite
          }));

      _ProductItem[editProdIndex] = newEditedProd;
    } else {
      print('....');
    }

    notifyListeners();
  }


  //to delete a particular item with a specific id
  Future< void> deleteFoodProduct (String Id) async{
    final url = Uri.https('naijasoup-70b95-default-rtdb.firebaseio.com',
          '/foodprod/$Id.json');
          
    await http.delete(url);

    final existingFoodIndex = _ProductItem.indexWhere((e) => e.id == Id);

    _ProductItem.removeAt(existingFoodIndex);
    notifyListeners();
  }
}
