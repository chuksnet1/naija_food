import 'package:flutter/material.dart';
import 'package:naija_food/model/cart.dart';
import 'package:provider/provider.dart';

class CartItemPage extends StatelessWidget {
  final String id;
  final String title;
  //final String prodId;
  final double price;
  final double quantity;
  const CartItemPage({
    super.key,
    //required this.prodId,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.grey,
        margin: EdgeInsets.all(5),
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('About to Delete'),
            content: Text('You are about to delete the Item'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('NO')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('YES')),
            ],
          ),
        );
      },
      onDismissed: (direction) => {
        Provider.of<CartItem>(context, listen: false).deleteCart(id),
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Text('\$$price'),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('x ${quantity}'),
        ),
      ),
    );
  }
}
