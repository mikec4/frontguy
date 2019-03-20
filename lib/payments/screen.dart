import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int data;
  GlobalKey<FormState> _formState = new GlobalKey<FormState>();
  String _name = '';
  String _password;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Form(
          key: _formState,
          child: Column(
            children: <Widget>[
              _fillName(),
              MaterialButton(
                color: Colors.green,
                child: Text('boom'),
                onPressed: (){
                  if( _name != null){
                    setState(() {
                      _name = null;
                    });
                    return null;
                  }
                },
              )
            ],
          )
        ),
      )
    );
  }

 _fillName(){
    return TextFormField(
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
          errorText: _name != null? null: "name is required",
          hintText: 'Enter name'),
      textInputAction: TextInputAction.done,
      validator: (value){
        if(value.isEmpty){
          return "Name field can not be empty";
        }
      },
      onSaved: (value){
        debugPrint("OnsavedCalled : $_name");
      },
      onFieldSubmitted: (value){
        assert(_formState.currentState.validate());
        //_formState.currentState.save();
        setState(() {
          _name = value;
        });
        debugPrint("Onfield called : $value");
      },
    );
 }
 _fillPassword(){

 }
}
