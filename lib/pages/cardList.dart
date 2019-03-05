import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'server.dart';
import 'food.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  Server server = new Server();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(),
          body: Container(
        child: _staggeredList(),
      ),
    );
  }

   Widget _card(Food food){
   return Container(
     width: 160.0,
     height: 270.0,
     child: InkWell(
      child: Card( 
       elevation: 0.0,
       child: ListView(
         shrinkWrap:false,
         children: <Widget>[
           Image(
             image: AssetImage(food.imagePath),
           ),
           SizedBox(height: 5.0,),
           Text(
             food.title,
             style: TextStyle(color: Colors.black,fontSize: 16.0),),
           SizedBox(height: 7.0,),
           Text(
             'TZS ${food.price}',
             style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 16.0,
               fontStyle: FontStyle.italic),),
           SizedBox(height: 4.0,),
           Row(
             children: <Widget>[
               Text(
                 food.soldItems,style: TextStyle(
                   fontSize: 15.0,
                   color: Colors.grey
                 ),),
               SizedBox(width: 80.0,),
               Icon(Icons.ac_unit,size: 20.0,)
               ],
           )
         ],
       ),
       ),
     ),
   );
  }

  Widget _staggeredList(){
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: server.getFoods().length,
      itemBuilder: (context, i)=> _card(server.getFoods()[i]),
      staggeredTileBuilder: (int i)=> StaggeredTile.fit(2),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
    );
  }
}