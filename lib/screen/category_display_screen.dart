import 'package:flutter/material.dart';
import 'package:naija_food/model/category.dart';
import 'package:naija_food/model/product_data.dart';

class CategoryDisplayScreen extends StatelessWidget {
  const CategoryDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*margin: EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: categoryItem.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey,
                  borderRadius: BorderRadius.circular(40)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                      child: Image.network(categoryItem[index].imageurl)),
                ),
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: Colors.black38),
                    height: 50,
                    width: 100,
                    child: Text('Gramma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),)))
              ],
            );
          }),*/
    );
  }
}
