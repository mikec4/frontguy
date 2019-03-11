import 'package:flutter/material.dart';

class PanelDropdown extends StatefulWidget {
  @override
  _PanelDropdownState createState() => _PanelDropdownState();
}

class Item{
  bool onExpanded = false;
  String header;
  Widget body;

  Item({this.onExpanded,this.header,this.body});

}
class _PanelDropdownState extends State<PanelDropdown>with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  String _myValue;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller =AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _animation =Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addListener((){
      setState(() {
        
      });
    });
    _animation.addStatusListener((status){
       if(status ==AnimationStatus.dismissed){
          _controller.forward();
       }
       if(status ==AnimationStatus.completed){
         _controller.forward();
       }
       _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animation.removeListener((){});
    _animation.removeStatusListener((status){});
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Panel Drop down'),),
      body: Center(
        child: _dropdown()
      ),
    );
  }
 

   
  _expansionTile(){
    return ExpansionTile(
    title: Text('Food types'),
    initiallyExpanded: _isExpanded,
    onExpansionChanged: (onChange){
      setState(() {
       _isExpanded =onChange; 
      });
    },
    children: <String>['Own number','Other number'].
    map((value) => 
    ListTile(
      title: Text(value),
      onTap: (){
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },)).toList(),
    );
  }

 
  _dropdown(){
    return DropdownButton(
      hint: Text('fOODS'),
      isDense: true,
      isExpanded: true,
      iconSize: 40.0,
      value: _myValue,
      onChanged: (String newValue){
        setState(() {
         _myValue =newValue; 
        });
      },
      items: <String>['Meat','Rice'].
      map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

