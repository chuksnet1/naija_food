import 'package:flutter/material.dart';
import 'package:naija_food/Widget/top_page.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/Product_Display_screen.dart';
import 'package:naija_food/screen/category_display_screen.dart';
import 'package:naija_food/screen/category_screen.dart';
import 'package:naija_food/screen/user_product_screen.dart';
import 'package:provider/provider.dart';

class HomeDisplayScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  const HomeDisplayScreen({super.key});

  @override
  State<HomeDisplayScreen> createState() => _HomeDisplayScreenState();
}

class _HomeDisplayScreenState extends State<HomeDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  int _selectedValue = 0;

  
  
  @override
  void initState() {
    
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Column(
        children: [
          TopPage(
            title: 'Food',
          ),
          SizedBox(
            height: 30,
          ),
          //to create container that control the tabview(product and category)
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
            controller: tabController,
            onTap: ((value) {
              setState(() {
                _selectedValue = value;
              });
              tabController.animateTo(value);
            }),
            tabs: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:  _selectedValue == 0
                      ? Colors.black
                      : Colors.grey.withOpacity(0.8),
                ),
                child: const Text(
                  'Popular',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _selectedValue == 1
                      ? Colors.black
                      : Colors.grey.withOpacity(0.8),
                ),
                child: const Text(
                  'Manage Items',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(           
            height: MediaQuery.of(context).size.height * 0.55,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const[
              ProductDisplayScreen(),
              UserProductScreen()
            ]),
          )
        ],
      ),
    );
  }
}
