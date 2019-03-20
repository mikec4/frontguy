import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String _newValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Book ticket'),
            centerTitle: true,

          ),

          SliverToBoxAdapter(
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              //height: 200.0,
              child: Wrap(
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  _fromColumn(),
                  _routeColumn(),
                  _toColumn(),

                ],
              ),
            ),
          )
        ],
      )
    );
  }
  _fromColumn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('FROM',style: TextStyle(color: Colors.white,fontSize: 19.0),),
        _dropDown()
      ],
    );
  }

  _toColumn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('TO',style: TextStyle(color: Colors.white,fontSize: 19.0,),),
//        SizedBox(height: 10.0,),
        Text('MWZ',style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),)
      ],
    );
  }
  _routeColumn(){
    return Column(
      children: <Widget>[
        Text('To',style:TextStyle(color: Colors.white,fontSize: 19.0))
      ],
    );
  }
  _dropDown(){
    return Container(
      color: Colors.transparent,
      child: DropdownButton(
          iconSize: 0.1,
          value: _newValue,
          hint: Text('_ _ _',
            style: TextStyle(color: Colors.white),),
          onChanged: (value){
            setState(() {
              _newValue = value;
            });
          },

          items:
          <String>['DSM','MWZ','KHM','ARS','MBY'].
          map<DropdownMenuItem<String>>((value){
            return DropdownMenuItem(
              child: DropdownButtonHideUnderline(
                child: Text(value,
                  style: TextStyle(

                      color: Colors.white,),),)  ,
              value: value,);
          }).toList()
      ),
    );
  }
}
