import 'package:flutter/material.dart';
import 'package:naija_food/Widget/order_item.dart';
import 'package:naija_food/model/order.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = 'order-screen';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderVal = Provider.of<OrderItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR ORDER'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: orderVal.item.length,
          itemBuilder: (context, index) => OrderItemPage(order: orderVal.item[index]),),
      ),
    );
  }
}
