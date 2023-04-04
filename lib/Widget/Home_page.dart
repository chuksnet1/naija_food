import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Drawer_page.dart';
import 'package:naija_food/model/cart.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/cart_screen.dart';
import 'package:naija_food/screen/category_screen.dart';
import 'package:naija_food/screen/home_display_screen.dart';
import 'package:naija_food/Widget/top_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final _pageController = PageController(initialPage: 0);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: const [
              HomeDisplayScreen(),
              CategoryScreen(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }, icon: const Icon(Icons.home, color: Colors.white,),),
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                    ),
                  );
                }, icon: const Icon(Icons.category, color: Colors.white,),),
                Stack(children: [
                  IconButton(onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white,),),
                Positioned(
                  top: 5,
                  right: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle),
                    child: Text(Provider.of<CartItem>(context, listen: false).cartItemCount.toString()),))
                ],),
                              
                IconButton(onPressed: (){}, icon: const Icon(Icons.verified_user, color: Colors.white,),),
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
            ),
          )
        ],
      )),
    );
  }
}
