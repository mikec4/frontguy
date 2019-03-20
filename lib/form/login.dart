import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontguy/pages/landingPage.dart';

class Login extends StatefulWidget {
  final PageController pageController;
  Login({this.pageController});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _phoneNumberStatus = false;
  bool _passwordStatus = false;

  GlobalKey<FormState> _formState = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _loginForm();
  }

  _loginForm(){
    return Form(
      key: _formState,
      child: ListView(
        padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 20.0),
        children: <Widget>[
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.start,
            validator: (value){
              if(value.isEmpty){
                setState(() {
                  _phoneNumberStatus = false;
                });
                return "Phone number required";
              }
              if(value.length < 10){
                setState(() {
                  _phoneNumberStatus = false;
                });
                return "Numbers should be 10 digits";
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
            //maxLengthEnforced: true,
            textAlign: TextAlign.start,
            validator: (value){
               if(value.isEmpty){
                 setState(() {
                   _passwordStatus = false;
                 });
                 return "Password required";
               }
               if(value.length < 4){
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
          _loginButton(),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          _oR(),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          _socialMediaLogin(),
         _registerTextButton(),
          //mainAxisAlignment: MainAxisAlignment.center,

        ],
      ),
    );
  }

  _loginButton(){
    return MaterialButton(
      animationDuration: Duration(milliseconds: 500),
      disabledColor: Colors.grey[50],
      disabledTextColor: Colors.white,
      onPressed: !_phoneNumberStatus || !_passwordStatus ?
      null: (){
        Navigator.pushAndRemoveUntil(context,
            _pageRouteBuilder(),
            (route) => false);
       // Navigator.push(context, _pageRouter());
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Text('Sign In',style: TextStyle(fontSize: 15.0),),
      color: !_phoneNumberStatus || !_passwordStatus? Colors.grey: Colors.blue
      ,
    );
  }
  _registerTextButton(){
    return  FlatButton(
        onPressed: (){
          widget.pageController.animateToPage(1,
              duration: Duration(milliseconds: 500),
              curve: Interval(0.0, 0.6,curve: Curves.fastOutSlowIn));
        },
        child : Text(
          'Swipe or tap here to sign up...',
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
        _drawLine(),

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
          InkWell(
            onTap: (){},
            child: Icon(FontAwesomeIcons.facebookF,
              color: Colors.blue,
              size: 30.0,
            ),
          ),
          InkWell(
            onTap: (){},
            child: Icon(FontAwesomeIcons.instagram,
               color: Colors.blue,
              size: 30.0,
            ),
          ),
          InkWell(
            onTap: (){},
            child: Icon(FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 30.0,),
          )
        ],
      ),
    );
  }

  _pageRouter(){
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (context,animation,secondAnimation){
        return LandingPage();
      },
      transitionsBuilder: (context,Animation<double>animation,
          Animation<double>secondAnimation, Widget child){
        return FadeTransition(
            opacity: Tween(begin: 0.0,end: 1.0)
                .animate(CurvedAnimation(
                parent: animation ,
                curve: Interval(0.0, 0.7, curve: Curves.easeInBack))),
           child: child,
        );
      }
    );
  }

  _pageRouteBuilder(){
    return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 850),
        pageBuilder: (context,animation,secondAnimation)=> LandingPage(),
        transitionsBuilder: (context,Animation<double>animation, secondAnimation,child){
          return FadeTransition(
            opacity: Tween(begin: 0.0,end: 1.0)
                .animate(CurvedAnimation(
                parent: animation ,
                curve: Interval(0.0, 0.7, curve: Curves.easeInBack))),
            child: FadeTransition(
              opacity: Tween(begin: 0.4,end: 1.0)
                  .animate(CurvedAnimation(
                  parent: animation ,
                  curve: Interval(0.4, 0.87, curve: Curves.easeInBack))),
              child: child,
            ),
          );
        }
    );
  }
}


