import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Landing Page'),),
      body: _staggeredGrid()
        
    );
  }

  BoxDecoration _loadImages(){
   return BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./assets/movie.jpg')
          )
        );
  }

  Widget _card(){
   return Container(
     width: 160.0,
     height: 270.0,
     child: Card( 
     elevation: 0.0,
     child: ListView(
       shrinkwap:false
       children: <Widget>[
         Image(
           image: AssetImage('./assets/movie.jpg'),
         ),
         SizedBox(height: 5.0,),
         Text(
           '2017 Summer children',
           style: TextStyle(color: Colors.black,fontSize: 16.0),),
         SizedBox(height: 7.0,),
         Text(
           'TZS 90,000',
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 16.0,
             fontStyle: FontStyle.italic),),
         SizedBox(height: 4.0,),
         Row(
           children: <Widget>[
             Text(
               '2 sold',style: TextStyle(
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
   );
  }

 
 
  Widget _container=Container(
    color: Colors.red,
    width: 150.0,
    height: 200.0,
  );
  Widget _staggeredGrid(){
    return StaggeredGridView.countBuilder(
     crossAxisCount: 4,
     shrinkWrap: false,
     primary: false,
     itemCount: 24,
     padding: EdgeInsets.all(14),
     mainAxisSpacing: 24,
     crossAxisSpacing: 12,
     itemBuilder: (context,i) => _container,
     staggeredTileBuilder: (int i)=> StaggeredTile.fit(2),
    );
  }
   
  Widget _gridView(){
    return GridView.count(
      padding: EdgeInsets.all(12.0),
      shrinkWrap: false,
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      addRepaintBoundaries: true,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
     children: <Widget>[
       _card(),_card(),_card(),_card(),
     ],
    );
  }
}