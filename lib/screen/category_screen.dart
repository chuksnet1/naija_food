import 'package:flutter/material.dart';
import 'package:naija_food/Widget/top_page.dart';
import 'package:naija_food/screen/category_detail_screen.dart';
import '../model/category.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'catego-screen';

  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final catItem = Provider.of<CategoryProvider>(context).categoItem;
    return Scaffold(
      body: 
       SingleChildScrollView(
          child: Column(
        children: [
          TopPage(
            title: 'Category',
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
          //margin: EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: catItem.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushNamed(
                            CategoryDetailScreen.routeName,
                            arguments: catItem[index].categoryName,
                          );
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(catItem[index].imageurl)),
                        ),
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
                              child: Text(
                                catItem[index].categoryName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white),
                              )))
                    ],
                  );
                }),
          )
        ],
      )),
    );
  }
}
