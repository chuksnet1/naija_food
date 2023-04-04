import 'package:flutter/material.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  static const routeName = 'edit-prod';

  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocus = FocusNode();
  final _categoryFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();


var _isInit = true;
var _isLoading = false;      //To set to loading using setstate


  var _editedNewVal = Product(
      category: '',
      price: '0',
      prodName: '',
      id: '',
      imageUrl: '',
    );

    //to initialize the textform
    var _initValues = {
      'title': '',
      'category': '',
      'price': '',
      'imageUrl': '',
    };



//this code is to check id from the incoming edit button you click and fill the field for editting
@override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments;

      if (productId != null) {
        //we are loading all the item entered in an id
        _editedNewVal = Provider.of<ProductProvider>(context, listen: false)
            .ProductItem.firstWhere((prod) => prod.id == productId);

        //values from the screen id where it is coming from should be displayed for editting
        _initValues = {
          'title': _editedNewVal.prodName,
          'category': _editedNewVal.category,
          'price': _editedNewVal.price.toString(),
          //'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
        _imageUrlController.text = _editedNewVal.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }


//code that put and convert the image url as soon as you click other text field
@override
  void initState() {
    _imageUrlFocus.addListener(updateImageUrl);

    super.initState();
  }

void updateImageUrl() {
    if (!_imageUrlFocus.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          (_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }



//To dispose the focus Node to avoid memory leak
  @override
  void dispose() {
    _imageUrlFocus.removeListener(updateImageUrl);
    _priceFocus.dispose();
    _categoryFocus.dispose();
    _imageUrlController.dispose();
   // _descriptionFocusNode.dispose();
    super.dispose();
  }



void _saveForm (){
  final isValid = _form.currentState!
        .validate();    //this is the code that helps validation to work
    if (!isValid) {
      return;
    }
  _form.currentState!.save();

  if(_editedNewVal.id != ''){
    Provider.of<ProductProvider>(context, listen: false)
          .updateProduct(_editedNewVal.id, _editedNewVal);
  }else{
    Provider.of<ProductProvider>(context, listen: false)
          .addProduct(_editedNewVal);
  }
 
 Navigator.of(context).pop();
}



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Add or Edit Product'),
        actions: [
          IconButton(
            onPressed: () => _saveForm(),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: ((value) {
                  FocusScope.of(context)
                                  .requestFocus(_priceFocus);
                }),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedNewVal = Product(
                    category: _editedNewVal.category,
                    price: _editedNewVal.price,
                    prodName: newValue!,
                    id: _editedNewVal.id,
                    imageUrl: _editedNewVal.imageUrl,
                    isFavourite: _editedNewVal.isFavourite,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: ((value) {
                  FocusScope.of(context)
                                  .requestFocus(_categoryFocus);
                }),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Amount';
                  }
                  if (double.parse(value) <= 0){
                    return 'Plenter value greater than 0';
                  }
                  if(double.tryParse(value) == null){
                    return 'Enter the real value';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedNewVal = Product(
                    category: _editedNewVal.category,
                    price: newValue!,
                    prodName: _editedNewVal.prodName,
                    id: _editedNewVal.id,
                    imageUrl: _editedNewVal.imageUrl,
                    isFavourite: _editedNewVal.isFavourite,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['category'],
                decoration: InputDecoration(labelText: 'Category'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: ((value) {}),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Meat or English or Local Dish or Pasteries As Category';
                  }
                  if((value !='Meat')&& (value != 'English')&&(value != 'Local Dish')&&(value != 'Pasteries')){
                    return 'Enter either Meat or English or Local Dish or Pasteries as Category';
                  }
                  
                  return null;
                },
                onSaved: (newValue) {
                  _editedNewVal = Product(
                    category: newValue!,
                    price: _editedNewVal.price,
                    prodName: _editedNewVal.prodName,
                    id: _editedNewVal.id,
                    imageUrl: _editedNewVal.imageUrl,
                    isFavourite: _editedNewVal.isFavourite,
                  );
                },
              ),
              Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(top: 8, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                                child: _imageUrlController.text.isEmpty
                                    ? Text('Enter URl')
                                    : FittedBox(
                                        child: Image.network(
                                          _imageUrlController.text,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Image Url'),
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.done,
                                  controller: _imageUrlController,
                                  focusNode: _imageUrlFocus,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide an image url';
                                    }
                                    if (!value.startsWith('http') &&
                                        !value.startsWith('https')) {
                                      return 'Please return a valid URL';
                                    }
                                    if (!value.endsWith('.png') &&
                                        !value.endsWith('jpg') &&
                                        !value.endsWith('.jpeg')) {
                                      return 'Please a valid .jpeg .jpg or .png Image Url';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) {
                                    _saveForm();
                                  },
                                  onSaved: (newValue) {
                                    _editedNewVal = Product(
                                      category: _editedNewVal.category,
                                      id: _editedNewVal.id,
                                      isFavourite: _editedNewVal.isFavourite,
                                      imageUrl: newValue!,
                                      price: _editedNewVal.price,
                                      prodName: _editedNewVal.prodName,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
            ],
          ),
        ),
      ),
    );
  }
}
