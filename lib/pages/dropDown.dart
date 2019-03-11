import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _TesterAppState createState() => _TesterAppState();
}

class _TesterAppState extends State<DropDown> {
  String _initialValue;

  @override
  Widget build(BuildContext context) {
    return _dropDownButton2();
  }

 

  _dropDownButton2(){
    return DropdownButton<String>(
      iconSize: 30.0,
      hint: Text('Payments'),
      value: _initialValue,
      onChanged: (String newValue){
        setState(() {
         _initialValue = newValue; 
        });
      },
      items: <String>['Vodacom - Mpesa','Tigo -TigoPesa','Airtel - Airtel Money'].
      map<DropdownMenuItem<String>>((String value){
         return DropdownMenuItem<String>(
           value: value,
           child: Container(
             width: 240.0,
             child: Text(value ,style: TextStyle(fontSize: 17.0),)),
         );
      }).toList(),
    );
  }
}