import 'package:flutter/material.dart';
import 'package:frontguy/form/login.dart';
import 'package:frontguy/form/phone.dart';
import 'package:frontguy/form/signUp.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController _pageController;
  Color left;
  Color right;

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
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _mainPageView()
      ),
    );
  }

  _mainPageView (){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0,bottom: 10.0),
          child: FlutterLogo(
            size: 110.0,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              Login(pageController: _pageController,),
              Phone(pageController: _pageController,)
            ],
          ),
        ),
      ],
    );
  }

  _drawLine(){
    return Container(
      height: 1.5,
      //width: 200.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey,Colors.grey],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [1.0,1.0])
      ),
    );
  }
}

