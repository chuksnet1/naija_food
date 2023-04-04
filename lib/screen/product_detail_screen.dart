import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Drawer_page.dart';

import 'package:naija_food/model/product_data.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'prod-Detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proId = ModalRoute.of(context)!.settings.arguments;

    final prodDis = Provider.of<ProductProvider>(context)
        .ProductItem
        .firstWhere((proI) => proI.id == proId);
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text(prodDis.prodName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Image.network(prodDis.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prodDis.prodName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'PRICE:   \$${prodDis.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.star_rate_outlined,
                        ),
                        Icon(Icons.star_rate_outlined),
                        Icon(
                          Icons.star_rate_outlined,
                        ),
                        Icon(
                          Icons.star_rate_outlined,
                        ),
                        Icon(
                          Icons.star_rate_outlined,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.home),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.call),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 270,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            Text(
                              'ADD TO CART',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
