import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'dashboard.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _name="";
  String _password="";

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  
  String signUp=""""
  mutation{
    createUser(name:name,password:password){
      name
    }
  }
  """;
  @override
  void initState(){
   super.initState();
   _nameController.addListener(_updateName);
   _passwordController.addListener(_updatePassword);
  }
  @override
  void dispose(){
   _nameController.removeListener(_updateName);
   _nameController.dispose();
   _passwordController.removeListener(_updatePassword);
   _passwordController.dispose();
   super.dispose();
  }
  _updateName() => setState(()=> _name =_nameController.text);
  _updatePassword()=> setState(()=>_password =_passwordController.text);


 Widget _signUpForm(){
    return Container(
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
           TextField(
                decoration: InputDecoration(
                  hintText: 'Your name'
                ),
                controller: _nameController,
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your password'
                ),
                controller: _passwordController,
              ),
              SizedBox(height: 10.0,),
              _signUpButton()
        ],
      ),
    );
 }
  
 Widget _signUpButton(){
  
   return Mutation(
     options: MutationOptions(
       document: signUp
     ),
     onCompleted: _onCompleted,
     builder: (RunMutation runMutation,QueryResult result){
      return MaterialButton(
        onPressed: ()=>
          runMutation({'name':_name,'password':_password})
         ,
        color: Colors.pink,
        child: Text(
          'signUp',
          style:TextStyle(color:Colors.white)),
      );
     }
   );
  }
  _onCompleted(QueryResult result){
    if (result.errors != null) debugPrint(result.errors.toString());
    if(result.loading) debugPrint('Loading....');
    
    debugPrint(result.data['name']);
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'),),
      body: _signUpForm()
    );
  }
}