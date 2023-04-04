import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Drawer_page.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:naija_food/screen/edit_product.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

//method for refreshing
  Future<void> reFreshUer(BuildContext context) async {
    await Provider.of<ProductProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Food'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProduct(),
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: DrawerPage(),
      body: RefreshIndicator(
        onRefresh: () => reFreshUer(context),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height * 0.51,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: prodData.ProductItem.length,
            itemBuilder: (contex, index) => Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(prodData.ProductItem[index].imageUrl),
                ),
                title: Text(prodData.ProductItem[index].prodName),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(EditProduct.routeName,
                              arguments: prodData.ProductItem[index].id);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: const Text('About To Delete'),
                                content: const Text(
                                    'Are You Sure You Want To Delete This Item?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        //error handling incase something went wrong and could not delete
                                        try {
                                          prodData.deleteFoodProduct(
                                              prodData.ProductItem[index].id);
                                        } catch (error) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Deleting went wrong')));
                                        }
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('YES')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('NO')),
                                ]),
                          );
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
