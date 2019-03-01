import 'package:flutter/material.dart';

class Poo extends StatefulWidget {
  @override
  _PooState createState() => _PooState();
}

class _PooState extends State<Poo> {
  String _name;
  String _password;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  
   _updateName(){
    setState(() {
     _name =_nameController.text; 
    });
  }
  _updatePassword(){
    setState(() {
     _password =_passwordController.text; 
    });
  }
  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateName);
    _passwordController.addListener(_updatePassword);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateName);
    _nameController.dispose();
    _passwordController.removeListener(_updatePassword);
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(left: 30.0,right: 30.0),
            shrinkWrap: true,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                 // errorText: 'User not available',
                  errorStyle: TextStyle(fontStyle: FontStyle.italic),  
                                  
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ) ,
                  hintText: 'Names'),
              ),
              SizedBox(height: 15.0,),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Passwords'),),
                SizedBox(height: 15.0,),
                MaterialButton(
                  onPressed: (){},
                  child: Text('Test'),
                  color: Theme.of(context).primaryColor,
                )
            ],
          ),
        ),
      ),
    );
  }
}