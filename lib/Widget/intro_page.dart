import 'package:flutter/material.dart';
import 'package:naija_food/Widget/Home_page.dart';
import 'package:naija_food/model/Kit_file.dart';
import 'package:naija_food/model/product_data.dart';
import 'image_transition_view.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
var _isLoading = true;
var _isInit = true;


  @override
  void didChangeDependencies() {
    
      Provider.of<ProductProvider>(context, listen: false).fetchData();
      
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: [
                ImageTransitionView(startIndex: 0),
                ImageTransitionView(startIndex: 1),
                ImageTransitionView(startIndex: 2),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.08,
            child: Text(
              'NAIJA FOOD',
              style: KitBold,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.white30,
                  Colors.white,
                  Colors.white,
                ], begin: Alignment.topCenter, end: Alignment.center),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The Quality Of A Your Meal \n Determine Your Health',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'The Way To A Man\'s Heart \n Is Through The Stomach',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 20,
            child: SlideAction(
              outerColor: Colors.black,
              alignment: Alignment.center,
              text: 'SLIDE TO START',

              onSubmit: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const HomePage(),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
