import 'package:flutter/material.dart';
import 'package:naija_food/Widget/image_transition_view.dart';

import 'package:naija_food/Widget/intro_page.dart';
import 'package:naija_food/model/cart.dart';
import 'package:naija_food/model/category.dart';
import 'package:naija_food/model/moving_intro_data.dart';
import 'package:naija_food/model/order.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/Product_Display_screen.dart';
import 'package:naija_food/screen/cart_screen.dart';
import 'package:naija_food/screen/category_detail_screen.dart';
import 'package:naija_food/screen/category_screen.dart';
import 'package:naija_food/screen/edit_product.dart';
import 'package:naija_food/screen/home_display_screen.dart';
import 'package:naija_food/screen/order_screen.dart';
import 'package:naija_food/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartItem(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderItem(),
        ),
        ChangeNotifierProvider(
          create: (context) => DummyMove(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroPage(),
        routes: {
          ProductDisplayScreen.routeName: (context) =>
              const ProductDisplayScreen(),
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CategoryDetailScreen.routeName: (context) =>
              const CategoryDetailScreen(),
          CategoryScreen.routeName: (context) => const CategoryScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          HomeDisplayScreen.routeName: (context) => const HomeDisplayScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          EditProduct.routeName: (context) => const EditProduct(),
          
        },
      ),
    );
  }
}
