import 'package:flutter/material.dart';

import 'bookTicket.dart';
import 'ticket.dart';

class FillPayments extends StatefulWidget {
  @override
  _FillPaymentsState createState() => _FillPaymentsState();
}

class _FillPaymentsState extends State<FillPayments> {

  
  String userName = "Michael Ntiriniga";
  String userPhoneNumber = '0715165569';

  String _myValue;
  String _phoneValue;
  String _paymentValue;



  bool _addPhoneTextField = false;
  bool _addNameTextField =false;
  bool _addPaymentTextField = false;

  bool _userTextField =false;
  bool _userPasswordField = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
     body: SafeArea(
        child: Container(
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
                _userTextField =false;
           }
           if(newValue == 'Own name'){
             _userTextField = true;
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
              _userPasswordField = false;
            } 
            if(newValue == 'My number'){
              _userPasswordField =true;
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
    return !_addNameTextField? _currentUserTextField(): Container(
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
    return !_addPhoneTextField? _currentUserPhoneNumberTextField():Container(
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
   
  _currentUserTextField(){
    return !_userTextField ? Text(''):Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Name',style:TextStyle(fontSize : 19.0)),
          TextFormField(
            initialValue: userName,
            style: TextStyle(fontSize: 19.0),
          )
        ],
      ),
    );
  }

  _currentUserPhoneNumberTextField(){
    return !_userPasswordField ? Text(''): Padding(
      padding: EdgeInsets.only(top: 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Phone number',style:TextStyle(fontSize:19.0)),
          TextFormField(
            style: TextStyle(fontSize:19.0),
            initialValue: userPhoneNumber,)
        ],
      ),
    );
  }
  _addAmountTextField(){
    return !_addPaymentTextField ? Text(' '): Padding(
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
   return  Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
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
                    onPressed: () =>
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context)=> Ticket(name: userName,phoneNumber: userPhoneNumber,) )),
                    color: Colors.blue,
                    child: Text(
                      'Pay',
                      style:TextStyle(
                        fontSize: 19.0,
                        color: Colors.white
                      )),
                  )
                ],
                ),
   );
 }
}