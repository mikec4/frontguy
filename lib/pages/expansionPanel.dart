import 'package:flutter/material.dart';

import 'dropDown.dart';

class Expansion extends StatefulWidget {
  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {

  List<String> phoneNumber = ['My number','Other number'];
  List<String> names = ['My name','Other name'];

  String myName = "Michael Ntiriniga";
  String myPhoneNumber = '0715165569';

  bool _expand = false;
  bool _addPhoneTextField = false;
  bool _addNameTextField =false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:ListView(
          children: <Widget>[
            _expansionTile1(),
            _expansionTile2(),
            _paymentMethods(),
            _dropDown(),
            _nameTextField(),
            _phoneTextField(),
            _addAmountTextField(),
            _bookButtons()
          ],
        ),
      ),
    );
  }
 
  
  _dropDown(){
    return Row(
      children: <Widget>[
        SizedBox(width: 134.0,),
        DropDown()
      ],
    );
  }
  _expansionTile1(){
    return ExpansionTile(
      title: Text('Fill names',style:TextStyle(color: Colors.red,fontSize:19.0)),
      children: names.map((String value)=>
         ListTile(
          title: Text(value),
          
          onTap: (){
            if (value == 'My name') {
            
            } else {
               setState(() {
                _addNameTextField =true; 
               });
               debugPrint('Other name clicked');
             }
          },
          )).toList(),
    );
  }
  _expansionTile2(){
    return ExpansionTile(
      initiallyExpanded: _expand,
      onExpansionChanged: (isExpanded){
        if (isExpanded) {
          setState(() {
           _expand =isExpanded; 
           debugPrint('$_expand');
          });
        }
      }, 
      title: Text('Phone number',style: TextStyle(color: Colors.red,fontSize:19.0),),
      children: phoneNumber.
      map((String value)=> ListTile(
        title: Text(value),
        onTap: (){
          if(value == 'My number'){
            if(_expand){
              setState(() {
               _expand = false; 
              });

              debugPrint('My number Clicked $_expand');
            }            
          }else{
            setState(() {
              _addPhoneTextField = true; 
            });
            debugPrint('Other number clicked');
          }
        },)).toList()
    );
  }
  
  _nameTextField(){
    return !_addNameTextField? Text(" "): Container(
      padding: EdgeInsets.all(20.0),
      width: 200.0,
      child:TextFormField(
        style: TextStyle(fontSize: 17.0),
        decoration: InputDecoration(hintText: 'Enter names'),
        ),
    );
  }
  _phoneTextField(){
    return !_addPhoneTextField? Text(' '):Container(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        style: TextStyle(fontSize: 17.0),
        keyboardType: TextInputType.numberWithOptions(signed: false),
        decoration: InputDecoration(hintText: 'Enter phone number'),
      ),
    );
  }
   _paymentMethods(){
    return Text(
              '  * Choose payment methods*',
              style:TextStyle(
                color: Colors.red,
                fontSize: 19.0));
  }
  _addAmountTextField(){
    return Padding(
      padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Amount',style: TextStyle(fontSize: 19.0),),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(signed: false),

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
                      fontSize: 17.0,
                      color: Colors.white)),
                  color: Colors.blue,
                ),
                SizedBox(width: 20.0,),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text(
                    'Done',
                    style:TextStyle(
                      fontSize: 17.0,
                      color: Colors.white
                    )),
                )
              ],
              );
 }
}