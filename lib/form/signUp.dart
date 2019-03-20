import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontguy/form/home.dart';
import 'package:frontguy/form/login.dart';

class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool _phoneNumberStatus = false;
  bool _passwordStatus = false;

  GlobalKey<FormState> _formState = new GlobalKey<FormState>();

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Exit this app'),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                child: Text('No', style: TextStyle (color: Colors.blue,fontSize: 19.0),),
                onPressed: () => Navigator.pop(context, false),
              ),

              FlatButton(
                color: Colors.white,
                child: Text('Yes', style: TextStyle (color: Colors.blue,fontSize: 19.0),),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _signUpForm(),
      ),
    );
  }

  _signUpForm(){
    return Form(
      key: _formState,
      child: ListView(
        padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 20.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,top: 50.0),
            child: FlutterLogo(
              size: 110.0,
            ),
          ),
          TextFormField(
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
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.start,
            validator: (value){
              if(value.isEmpty){
                setState(() {
                  _passwordStatus = false;
                });
                return "Password required";
              }
              if(value.length <= 3){
                setState(() {
                  _passwordStatus = false;
                });
                return "Password should not be less than 4 digits";
              }
            },
            onSaved: (value){
              setState(() {
                _passwordStatus = true;
              });
            },
            onFieldSubmitted: (value){
              if(_formState.currentState.validate()){
                _formState.currentState.save();
              }
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(FontAwesomeIcons.lock),
                hintText: 'Password'
            ),

          ),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          MaterialButton(
            onPressed: !_phoneNumberStatus || !_passwordStatus ? null: (){},
            textColor: Colors.white,
            padding: EdgeInsets.all(15.0),
            child: Text('Sign Up',style: TextStyle(fontSize: 15.0),),
            disabledTextColor: Colors.white,
            color: !_phoneNumberStatus || !_passwordStatus? Colors.grey : Colors.blue,
          ),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          _oR(),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          _socialMediaLogin(),
          _registerTextButton()
          //mainAxisAlignment: MainAxisAlignment.center,

        ],
      ),
    );
  }

  _registerTextButton(){
    return  FlatButton(
        onPressed: (){
         Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (context)=> Home()),
                 (route) => false);
        },
        child : Text(
          'Go to login...',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0),));
  }

  _oR(){
    return Row(
      children: <Widget>[
        _drawLine(),
        SizedBox(width: 5.0,),
        Text('OR',style: TextStyle(color: Colors.grey,fontSize: 17.0),),
        SizedBox(width: 5.0,),
        _drawLine()
      ],
    );
  }

  _drawLine(){
    return Container(
      height: 1.5,
      width: 147.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey,Colors.grey],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [1.0,1.0])
      ),
    );
  }
  _socialMediaLogin(){
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10.0,
        children: <Widget>[
          Icon(FontAwesomeIcons.facebookF,
            color: Colors.blue,
            size: 30.0,),
          Icon(FontAwesomeIcons.instagram,
            color: Colors.blue,
            size: 30.0,),
          Icon(FontAwesomeIcons.twitter,
            color: Colors.blue,
            size: 30.0,)
        ],
      ),
    );
  }
}
