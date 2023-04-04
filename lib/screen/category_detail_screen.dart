import 'package:flutter/material.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = 'category-Display';

  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catRouteName = ModalRoute.of(context)!.settings.arguments;

    final displayCate = Provider.of<ProductProvider>(context)
        .ProductItem
        .where(
          (prodCatName) => prodCatName.category == catRouteName,
        )
        .toList();
    print(displayCate);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catRouteName.toString(),
        ),
      ),
      body: ListView.builder(
        itemCount: displayCate.length,
        itemBuilder: ((context, index) => singleViewHere(
          context,
              displayCate[index].imageUrl,
              displayCate[index].prodName,
              displayCate[index].id,
            )),
      ),
    );
  }
}

Widget singleViewHere(BuildContext context, String image, String name, String id,) {
  return GestureDetector(
    onTap: (() {
      Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: id);
    }),
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 210, 208, 208)),
      margin: const EdgeInsets.all(8),
      child: Stack(children: [
        Column(
          children: [
            ClipRRect(
              child: Image.network(image),
            ),
            Text('')
          ],
        ),
        Positioned(
          bottom: 16,
          left: 8,
          child: Container(
            alignment: Alignment.center,
            height: 30,
            width: 100,
            decoration: const BoxDecoration(color: Colors.black38),
            child: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,) , textAlign: TextAlign.center,),
          ),
        ),
        
      ]),
    ),
  );
}
