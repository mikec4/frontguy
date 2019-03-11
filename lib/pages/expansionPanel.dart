import 'package:flutter/material.dart';

import 'dropDown.dart';

class Expansion extends StatefulWidget {
  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {

  

  String myName = "Michael Ntiriniga";
  String myPhoneNumber = '0715165569';

  String _myValue;
  String _phoneValue;
  String _paymentValue;



  bool _addPhoneTextField = false;
  bool _addNameTextField =false;
  bool _addPaymentTextField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:ListView(
          children: <Widget>[
            _fillNameDropdown(),
            _fillPhoneNumberDropDown(),
            _paymentsDropDown(),
            _nameTextField(),
            _phoneTextField(),
            _addAmountTextField(),
            _bookButtons()
          ],
        ),
      ),
    );
  }
 
   _fillNameDropdown(){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: DropdownButton(
        isExpanded: true,
        value:_myValue ,
        onChanged: (String newValue){
          setState(() {
           _myValue =newValue; 
           if(newValue == 'Other name'){
                _addNameTextField =true;

           }
           if(newValue == 'Own name'){
             _addNameTextField = false;
           }
          });
        },
        iconSize: 30.0,
        hint: Text('Fill names',style: TextStyle(color: Colors.red,fontSize: 19.0),),
        items: <String>['Own name','Other name']
        .map((value){
          return DropdownMenuItem(
              child: Text(value,style: TextStyle(fontSize: 19.0),),
              value: value,
            );
        }).toList(),
      ),
    );

  }

  _fillPhoneNumberDropDown(){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: DropdownButton(
        isExpanded: true,
        hint: Text('Phone number',style:TextStyle(color:Colors.red,fontSize:19.0)),
        value: _phoneValue,
        onChanged: (newValue){
          setState(() {
           _phoneValue =newValue;

            if (newValue == 'Other number') {
              _addPhoneTextField = true;
            } 
            if(newValue == 'My number'){
              _addPhoneTextField = false;
            }
          });
        },
        items: <String>['My number','Other number']
        .map((value){
          return DropdownMenuItem(
            child: Text(value, style: TextStyle(fontSize: 19.0),),
            value: value,
          );
        }).toList(),
      ),
    );
  }
  _paymentsDropDown(){
    return DropdownButton(
      iconSize: 30.0,
      isExpanded: true,
      value: _paymentValue,
      hint: Text('Choose a payment method',style: TextStyle(color: Colors.red,fontSize: 19.0),),
      onChanged: (newValue){
        setState(() {
         _paymentValue = newValue;
         _addPaymentTextField = true;
        });
      },
      items: <String>['Vodacom-Mpesa','Tigo- tigopesa','Airtel Money','Halotel - Halopesa']
      .map((value){
        return DropdownMenuItem(
          child: Text(value,style: TextStyle(fontSize: 19.0),),
          value: value,
        );
      }).toList(),
    );
  }
 
  
  
  _nameTextField(){
    return !_addNameTextField? Text(" "): Container(
      padding: EdgeInsets.only(top: 20.0),
      width: 200.0,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Names',style: TextStyle(fontSize: 19.0),),
          TextFormField(
            style: TextStyle(fontSize: 19.0),
            decoration: InputDecoration(),
            ),
        ],
      ),
    );
  }
  _phoneTextField(){
    return !_addPhoneTextField? Text(' '):Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Phone number',style:TextStyle(fontSize: 19.0)),
          TextFormField(
            style: TextStyle(fontSize: 19.0),
            keyboardType: TextInputType.numberWithOptions(signed: false),
            decoration: InputDecoration(),
          ),
        ],
      ),
    );
  }
   
  _addAmountTextField(){
    return !_addPaymentTextField? Text(' '): Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Amount',style: TextStyle(fontSize: 19.0),),
          TextFormField(
            style: TextStyle(fontSize:19.0),
            keyboardType: TextInputType.number,

          ),
        ],
      ),
    );
  }

   _bookButtons(){
   return  Row(
              children: <Widget>[
                SizedBox(width: 190.0,),
                MaterialButton(
                  onPressed: (){},
                  child: Text(
                    'Cancel',
                    style:TextStyle(
                      fontSize: 19.0,
                      color: Colors.white)),
                  color: Colors.blue,
                ),
                SizedBox(width: 20.0,),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text(
                    'Pay',
                    style:TextStyle(
                      fontSize: 19.0,
                      color: Colors.white
                    )),
                )
              ],
              );
 }
}