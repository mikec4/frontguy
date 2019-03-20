import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontguy/pages/landingPage.dart';
import 'food.dart';

import 'bus.dart';
import 'bus2.dart';

class Product2 extends StatelessWidget {
  final Food food;

  Product2({Key key,@required this.food}):super(key:key);
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
  slivers: <Widget>[
     SliverAppBar(
       backgroundColor: Colors.white,
       expandedHeight: 300.0, 
       flexibleSpace: FlexibleSpaceBar(
         title: Text('Product two'),
         background: Image(
           image: AssetImage(food.imagePath),
           fit: BoxFit.cover,
        ),
      ),
    ),
    SliverPadding(padding: EdgeInsets.only(top: 20.0),),
    Bus2(),
    // SliverGrid(
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200.0,
    //     mainAxisSpacing: 10.0,
    //     crossAxisSpacing: 10.0,
    //     childAspectRatio: 4.0,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return Container(
    //         alignment: Alignment.center,
    //         color: Colors.teal[100 * (index % 9)],
    //         child: Text('grid item $index'),
    //       );
    //     },
    //     childCount: 20,
    //   ),
    // ),
//    SliverFixedExtentList(
//      itemExtent: 50.0,
//      delegate: SliverChildBuilderDelegate(
//        (BuildContext context, int index) {
//          return Container(
//            alignment: Alignment.center,
//            color: Colors.lightBlue[100 * (index % 9)],
//            child: Text('list item $index'),
//          );
//        },
//      ),
//    ),
//
//
 ],
)
    );
  }
   
   
}