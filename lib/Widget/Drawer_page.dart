import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Home_page.dart';
import 'package:naija_food/screen/home_display_screen.dart';
import 'package:naija_food/screen/order_screen.dart';
import 'package:naija_food/screen/user_product_screen.dart';


class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shop), title: Text('Shop'), onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
          },),
          Divider(),
          ListTile(leading: Icon(Icons.payment), title: Text(' ORDER '), onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },),
          Divider(),
          ListTile(leading: Icon(Icons.shop), title: Text('Manage Product'), onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProductScreen(),
                    ),
                  );
            
          },),
        ],
      ),);
  }
}