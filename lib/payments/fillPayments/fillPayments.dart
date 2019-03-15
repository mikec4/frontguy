import 'package:flutter/material.dart';

import '../ticket.dart';
import '../Passenger.dart';


class FillPayments extends StatefulWidget {
  @override
  _FillPaymentsState createState() => _FillPaymentsState();
}

class _FillPaymentsState extends State<FillPayments> {

  Passenger passenger = new Passenger();


  
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

  bool _addFillNameText = false;
  bool _addFillPhoneText = false;
  bool _addPaymentMethod = false;

  String myName = '';


  GlobalKey<FormState> _formState = new GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
     body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            _fillNameText(),
            _fillNameDropdown(),
            _fillPhoneText(),
            _fillPhoneNumberDropDown(),
            _paymentMethodText(),
            _paymentsDropDown(),
            //_nameTextField(),
            //_phoneTextField(),
            _formField(),
            //_addAmountTextField(),
            _bookButtons()
          ],
        ),
      ),
    );
  }

  _fillNameText(){
    return !_addFillNameText? Text(''):
    Text(
      'Fill names',
      style: TextStyle(fontSize: 19.0,color: Colors.red),
    );
  }


 _fillNameDropdown(){
    return DropdownButton(
      isExpanded: true,
      value:_myValue ,
      onChanged: (String newValue){
        setState(() {
          _addFillNameText= true;
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
    );

  }

  _fillPhoneText(){
    return !_addFillPhoneText? Text(''):
        Text(
          'Fill Phone number',
          style: TextStyle(color: Colors.red,fontSize: 19.0),
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
            _addFillPhoneText = true;
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

  _paymentMethodText(){
    return !_addPaymentMethod? Text(''):
        Text('Choose a payment method',
          style: TextStyle(color: Colors.red,fontSize: 19.0),
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
          _addPaymentMethod = true;
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
 
  _formField(){
    return Form(

      key: _formState,
      child: Wrap(
        children: <Widget>[
          _nameTextField(),
          _phoneTextField(),
          _amountTextField()
        ],
      ),
    );
  }
   String _errorMessage= '';

  _nameTextField(){
    return !_addNameTextField? _currentUserTextField(): Container(
      padding: EdgeInsets.only(top: 20.0),
      //width: 200.0,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Names',style: TextStyle(fontSize: 19.0),),
          TextFormField(
            decoration: InputDecoration(
              errorText: _errorMessage != null? null:"Name is  required"
            ),
            validator: (String value){
              if(value.isEmpty || value == null){
                return "Name can not be empty";
              }
            },
            onSaved: (value){
              passenger.setName(value);
              setState(() {
                myName = value;
              });
            },
            onFieldSubmitted: (value){
              assert(_formState.currentState.validate());
              _formState.currentState.save();
              //passenger.name = value;
            },
            style: TextStyle(fontSize: 19.0),
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
            validator: (value){
              if(value.isEmpty){
                return "Phone number is required";
              }
            },
            onSaved: (value){
              passenger.setPhoneNumber(value);
            },
            onFieldSubmitted: (value){
              assert(_formState.currentState.validate());
              _formState.currentState.save();
              //passenger.phoneNumber = value;
            },
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
            onFieldSubmitted: (value){
              passenger.setName(value);
            },
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
            onFieldSubmitted: (value){
              passenger.setPhoneNumber(value);
            },
            style: TextStyle(fontSize:19.0),
            initialValue: userPhoneNumber,)
        ],
      ),
    );
  }
  _amountTextField(){
    return !_addPaymentTextField ? Text(' '): Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Amount',style: TextStyle(fontSize: 19.0),),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Amount is required";
              }
            },
            onSaved: (value){
              passenger.setAmount(value);
              
            },
            onFieldSubmitted: (value){
              assert(_formState.currentState.validate());
              _formState.currentState.save();
              //passenger.amount = value;
            },
            style: TextStyle(fontSize:19.0),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

   _bookButtons(){
   return  Padding(
     padding: const EdgeInsets.only(top:20.0),
     child: Wrap(
       spacing: 20.0,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: <Widget>[
                 // SizedBox(width: 190.0,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      width: 130.0,
                      height: 45.0,
                      child: MaterialButton(
                        onPressed: (){},
                        child: Text(
                          'Cancel',
                          style:TextStyle(
                            fontSize: 19.0,
                            color: Colors.white)),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      width: 130.0,
                      height: 45.0,
                      child: MaterialButton(
                        onPressed: () {
                          print('Passenger name ${passenger.getName().toString()}');

                          if(passenger.getName.toString() ==null){
                            setState((){_errorMessage = null;});
                          }
                          if(passenger.getPhoneNumber.isEmpty) return "Phone number is required";

                          if(passenger.getAmount.isEmpty) return "Amount is required";
                          Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context)=> Ticket(passenger: passenger,) ));},
                        color: Colors.blue,
                        child: Text(
                          'Pay',
                          style:TextStyle(
                            fontSize: 19.0,
                            color: Colors.white
                          )),
                      ),
                    ),
                  )
                ],
                ),
   );
 }

}