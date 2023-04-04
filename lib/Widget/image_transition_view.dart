import 'dart:math';

import 'package:flutter/material.dart';
import 'package:naija_food/model/moving_intro_data.dart';
import 'package:naija_food/model/product_data.dart';
import 'package:provider/provider.dart';

class ImageTransitionView extends StatefulWidget {
  static const routeName = 'Image-trans';
  final int startIndex;
  const ImageTransitionView({super.key, required this.startIndex});

  @override
  State<ImageTransitionView> createState() => _ImageTransitionViewState();
}

class _ImageTransitionViewState extends State<ImageTransitionView> {
  


  @override
  Widget build(BuildContext context) {
    final transImage = Provider.of<DummyMove>(context).Moving_Dummy;
    
    return Transform.rotate(
      angle: 1.96*pi,
      child: SizedBox(
        height: MediaQuery.of(context).size.height *0.6,
        width: MediaQuery.of(context).size.width *0.6,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2,),
          itemCount: transImage.length, 
          itemBuilder: (context, index) {
            return Container(                         
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(transImage[index].imageUrl,)),
            );
          },),
      ),
      );
  }
}