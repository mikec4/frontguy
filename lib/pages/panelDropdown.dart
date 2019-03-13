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
  CurvedAnimation _curvedAnimation;

  String _myValue;

  bool _addTextField = false;

  @override
  void initState() {
    super.initState();
    _controller =AnimationController(vsync: this,duration: Duration(milliseconds: 5000));
   // _curvedAnimation =CurvedAnimation(parent: _controller,curve: Curves.fastLinearToSlowEaseIn);
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
    });
    _controller.forward();
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
    String name = "Michael Ntiriniga";

    return Scaffold(
      appBar: AppBar(title: Text('Panel Drop down'),),
      body: SafeArea(
        
        child: Column(
          children: <Widget>[
            _dropdown(),
            _transition(),
            _textField()
          ],
        ),
      )
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

         if(newValue == 'Meat'){
          _addTextField =true;
         } else {
           _addTextField = false;
         }
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

 
  _transition(){
    return FadeTransition(
      alwaysIncludeSemantics: true,
      opacity: _animation,
      child: _button()
      );
  }
  _button(){
    return MaterialButton(
      onPressed: (){},
      color: Colors.red,
      child: Text('Animate'),
    );
  }
  _textField(){
    return !_addTextField? Text(' '):
    TextFormField(
      initialValue: "Michael Ntiriniga",
      decoration: InputDecoration(
        hintText: 'Animate now',
        ),
      );
  }
}

