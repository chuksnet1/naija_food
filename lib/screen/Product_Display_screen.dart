import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naija_food/model/cart.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductDisplayScreen extends StatefulWidget {
  static const routeName = 'product-Deisplay';
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {


  
  @override
  Widget build(BuildContext context) {
    final prodData1 = Provider.of<ProductProvider>(context).ProductItem;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: MasonryGridView.count(
          //padding: const EdgeInsets.symmetric(vertical: 10.0),
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          itemCount: prodData1.length,
          mainAxisSpacing: 10,
          itemBuilder: ((context, index) {
            return SIngleTileView(
              context,
              prodData1[index].imageUrl,
              prodData1[index].prodName,
              prodData1[index].price,
              prodData1[index].id,
            );
          })),
    );
  }

  Widget SIngleTileView(
    BuildContext context,
    String prodImage,
    String name,
    String price,
    String id,
  ) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 172, 171, 171),
              //borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                ClipRRect(
                  //borderRadius: BorderRadius.circular(20),
                  child: Image.network(prodImage),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //padding: const EdgeInsets.all(1.0),
                      child: Text(
                        '\$${price}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Provider.of<CartItem>(context, listen: false)
                              .addCartItem(
                            id,
                            double.parse(price),
                            name,
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Item to Cart'),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: (() {
                                  Provider.of<CartItem>(context, listen: false)
                                      .singleRemoveItem(id);
                                }),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 15,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 5,
          child: Container(
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
            bottom: 50,
            left: 8,
            child: Container(
              width: 100,
              color: Colors.black45,
              child: Text(
                name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
      ],
    );
  }
}
