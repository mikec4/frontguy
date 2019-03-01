import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'dart:async';

import 'appModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _name;
  String _password;
  String errorMessage;
  bool _saving =false;
  
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  
   
  
  _updateName(){
    setState(() {
     _name =_nameController.text; 
    });
  }
  _updatePassword(){
    setState(() {
     _password=_passwordController.text; 
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
   
   
  Widget _signInForm(){
    return Container(
      padding: EdgeInsets.all(40.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              hintText: 'Your name or phone number'),
          ),
          SizedBox(height: 10.0,),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              hintText: 'Your password'),
          ),
          SizedBox(height: 10.0,),
          _signInButton()
        ],
      ),
    );
  }
  Widget _signInButton(){
    void _submit() {
    setState(() {
      _saving = true;
    });

    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {
      setState(() {
        _saving = false;
      });
    });

  }
    String credentials = """
    mutation SignIn(\$name:String!,\$password:String!){
      signIn(name:\$name,password:\$password){
        token
      }
    }
    """;
    return ScopedModelDescendant<AppModel>(
      builder: (context,child,model) => Mutation(
        options: MutationOptions(document: credentials),
        onCompleted: _onCompleted(model.setToken),
        builder: (RunMutation runMutation,QueryResult result){
          if(result.loading){
            
          }
          return MaterialButton(
          color: Theme.of(context).primaryColor,
          child: Text('Sign In'),
          onPressed:(){
            _submit();
            runMutation({'name':_name,'password':_password});},
          textTheme: ButtonTextTheme.primary,
            );
        },
      )
      );
  }
  _onCompleted(Function setToken)=>(QueryResult result){
    if(result.errors !=null){
      errorMessage =result.errors.toString();

     debugPrint(errorMessage);
     }
   if(result.loading){
     debugPrint('Loading...');}
     debugPrint(result.data['signIn']['token']);
    setToken(result.data['signIn']['token']);

     Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (_)=>false);
  };
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Home'),),
      body:ModalProgressHUD(
        child: SingleChildScrollView(child: Container(child: _signInForm())),
        inAsyncCall: _saving,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),) 
    );
  }
}