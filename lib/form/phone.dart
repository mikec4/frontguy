import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontguy/form/signUp.dart';

class Phone extends StatefulWidget {
  final PageController pageController;

  Phone({this.pageController});

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  bool _phoneNumberStatus = false;

  GlobalKey<FormState> _formState = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _formPhoneNumber();
  }

  _formPhoneNumber(){
    return Form(
      key: _formState,
      child: ListView(
        padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 20.0),
        children: <Widget>[
          TextFormField(
            maxLength: 10,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            validator: (value){
              if(value.isEmpty){
                setState(() {
                  _phoneNumberStatus = false;
                });
                return "Phone number required";
              }
              if(value.length <= 9){
                setState(() {
                  _phoneNumberStatus = false;
                });
                return "Numbers should 10 digits";
              }
            },
            onSaved: (value){
              setState(() {
                _phoneNumberStatus = true;
              });
            },
            onFieldSubmitted: (value){
              if(_formState.currentState.validate()){
                _formState.currentState.save();
              }
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(FontAwesomeIcons.phone),
                hintText: 'Phone number'
            ),

          ),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          MaterialButton(
            onPressed: !_phoneNumberStatus? null: (){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context)=> SignUp()),
                      (route)=> false);
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(15.0),
            child: Text('Next',style: TextStyle(fontSize: 15.0),),
            disabledTextColor: Colors.white,
            color: !_phoneNumberStatus ? Colors.grey : Colors.blue,
          ),
          //Padding(padding: EdgeInsets.only(top: 10.0),),
          Padding(
            padding: const EdgeInsets.only(top:10.0,left: 16,right: 14,bottom: 8.0),
            child: Text('    A code will be sent to you for verification'),
          ),
          _registerTextButton()
        ],
      ),
    );
  }

  _registerTextButton(){
    return  FlatButton(
        onPressed: (){
          widget.pageController.animateToPage(0,
              duration: Duration(milliseconds: 500),
              curve: Interval(0.0, 0.6,curve: Curves.fastOutSlowIn));
        },
        child : Text(
          'Swipe or tap here to login...',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0),));
  }
}
