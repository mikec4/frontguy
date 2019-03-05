import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';


import 'dart:ui' as ui;
import 'dart:async';

import 'food.dart'; 

class Product extends StatefulWidget {
 final Food food;
 Product({Key key,@required this.food}) :super(key:key);

  @override
  _ProductState createState() => _ProductState(food);
}

class _ProductState extends State<Product> {
 Food food;   

 _ProductState(this.food);

List<String> _namesList = [
  "Michael","Clara","Sally","Theo","Junior","Blandina",
  "McKenzie","Caroline","Wendy","Ntiriniga","Dabanga",
  "kafanya"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
      ),
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('grid item $index'),
          );
        },
        childCount: 20,
      ),
    ),
    SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        },
      ),
    ),
  ],
)
    );
  }
   
  _materialSearch(){
    return MaterialSearch(

        results: _namesList.map((name){
          return MaterialSearchResult(
            text: name,
            value: name,
          );
        }).toList(),
        placeholder: 'Family names',
        //onSelect: (value)=> debugPrint('$value is selected'),
        onSubmit: (value)=> debugPrint('$value is submitted'),
      );
  }
} 