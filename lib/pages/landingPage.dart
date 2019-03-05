import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'product.dart';
import 'server.dart';
import 'food.dart';
import 'product2.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Server server = new Server();

   int imageWidth;
   int imageheight;
   double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Landing Page'),),
      body: _staggeredGrid()
        
    );
  }
  
 
  // Future<ui.Image> getImageSize(Food food) async{

  //   Image image = Image.asset(food.imagePath);
  //   Completer<ui.Image> completer = new Completer<ui.Image>();
  //   image.
  //   image.resolve(ImageConfiguration())
  //   .addListener((ImageInfo info, bool _)=> completer.complete(info.image));
  //   return completer.future;
  // }

 
  Widget _card(Food food){
   return InkWell(
     onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Product2(food: food,))),
     child: Card( 
       elevation: 0.0,
       clipBehavior: Clip.hardEdge,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(10.0)),
         side: BorderSide(
           color: Colors.grey[400],
         )
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Image(
           image: AssetImage(food.imagePath),),
         SizedBox(height: 5.0,),
         Row(
           children: <Widget>[
             SizedBox(width: 7.0,),
             Text(
             food.title,
             style: TextStyle(color: Colors.black,fontSize: 16.0),),
           ]
         ),
         SizedBox(height: 7.0,),
         Row(
           children: <Widget>[
             SizedBox(width: 7.0,),
             Text(
              'TZS ${food.price}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),),
           ],
         ),
         SizedBox(height: 4.0,),
         Row(
           children: <Widget>[
             SizedBox(width: 7.0,),
             Text(
               food.soldItems,style: TextStyle(
                 fontSize: 15.0,
                 color: Colors.grey),),
             SizedBox(width: 100.0,),
             Icon(Icons.ac_unit,size: 20.0,)
             ],
         ),
         SizedBox(height: 8.0,)
       ],
     ),
     ),
   );
  }

  
  Widget _staggeredGrid(){
    return StaggeredGridView.countBuilder(
     crossAxisCount: 4,
     shrinkWrap: false,
     primary: false,
     itemCount: server.getFoods().length,
     padding: EdgeInsets.all(14),
     mainAxisSpacing: 5,
     crossAxisSpacing: 5,
     itemBuilder: (context,i) => _card(server.getFoods()[i]),
     staggeredTileBuilder: (int i)=> StaggeredTile.fit(2),
    );
  }
   
 
}