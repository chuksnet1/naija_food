import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Drawer_page.dart';
import 'package:naija_food/Widget/cart_item_page.dart';
import 'package:naija_food/model/cart.dart';
import 'package:naija_food/model/order.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVal = Provider.of<CartItem>(context).items;
    final cartGet = Provider.of<CartItem>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proceed To Checkout'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TOTAL'),
                  Text(
                      '\$${Provider.of<CartItem>(context, listen: false).totalAmount}'),
                  SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderItem>(context, listen: false).addOrder(
                        cartGet.items.values.toList(),
                        cartGet.totalAmount,
                      );
                      cartGet.clearCart();
                    },
                    child: Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: cartVal.length,
                itemBuilder: (context, index) => CartItemPage(
                  id: cartVal.keys.toList()[index],
                  price: cartVal.values.toList()[index].price,
                  quantity: cartVal.values.toList()[index].quantity,
                  title: cartVal.values.toList()[index].prodName,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
