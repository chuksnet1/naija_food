import 'package:flutter/material.dart';
import 'package:naija_food/model/order.dart';
import 'package:intl/intl.dart';
import 'dart:math';


class OrderItemPage extends StatefulWidget {
  final Order order;

  const OrderItemPage({super.key, required this.order});

  @override
  State<OrderItemPage> createState() => _OrderItemPageState();
}

class _OrderItemPageState extends State<OrderItemPage> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(top: 10),
          child: ListTile(
            leading: Text('\$${widget.order.amount}'),
            title: Text( widget.order.date.toString()),
            trailing: IconButton(onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
            }, 
            icon: Icon(_expanded? Icons.expand_less : Icons.expand_more,),),
          ),          
        ),
        if(_expanded)
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width*0.9,
          height: min(widget.order.product.length * 20.0 + 50, 100),
          child: ListView(children: widget.order.product.map((e) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              padding: const EdgeInsets.all(8.0),
              child: Text(e.prodName),
            ),
            SizedBox(width: 10,),
            Text('Total: \$${e.price * e.quantity}'),
            SizedBox(width: 10,),
            Text('x  ${e.quantity}')
          ],)).toList(),)
        )
      ],
    );
  }
}