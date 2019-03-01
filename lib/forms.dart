import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'appModel.dart';

import 'dashboard.dart';



class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey =GlobalKey<FormState>();

  bool _isInAsyncCall = false;

  bool _isInvalidAsyncUser =false;
  bool _isInvalidAsyncPass = false;

  String _name;
  String _password;
  bool _isLoggedIn = false;

  bool _userNotFound =false;
  bool _passwordNotFound =false;


 String _validateUser(String user){
    // if (user.length > 10) {
    //    return 'name should not be greater than 10 characters';
    // }
    if(_isInvalidAsyncUser){
      return "User not found";
    }
    return null;
  }
 String _validatePassword(String password){
   
    if(_isInvalidAsyncPass){
      return 'Incorrect password';
    }
    return null;
  }
  _submit(){
    if(_loginFormKey.currentState.validate()){
      _loginFormKey.currentState.save();
     FocusScope.of(context).requestFocus(FocusNode());
      setState(() {
       _isInAsyncCall =true; 
      });
    }
  
    Future.delayed(Duration(seconds: 4),(){

      setState(() {
        if(_userNotFound){
          _isInvalidAsyncUser =_userNotFound;
          _isInvalidAsyncPass =false;

        } 
        if(_passwordNotFound){
          _isInvalidAsyncPass =_passwordNotFound;
          _isInvalidAsyncUser = false;
        }
        _isInAsyncCall = false;
      });

    });
  }

  Widget _loginForm(BuildContext context){
    final TextTheme textTheme =Theme.of(context).textTheme;

    _loginFormKey.currentState?.validate();
    return Form(
      key: this._loginFormKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key('name'),
              decoration: InputDecoration(
                hintText: 'Your name'
              ),
              onSaved: (value)=> _name =value,
              validator: _validateUser,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              key: Key('password'),
              decoration: InputDecoration(
                hintText: 'Your password'
              ),
              onSaved: (value)=> _password=value,
              validator: _validatePassword,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: _loginInButton(),
          )
        ],
      ),
    );
  }
  _loginInButton(){
    String credentials = """
    mutation SignIn(\$name:String!,\$password:String!){
      signIn(name:\$name,password:\$password){
        token
        name
      }
    }
    """;
    return ScopedModelDescendant<AppModel>(
      builder: (context,child,model)=> Mutation(
        options: MutationOptions(document: credentials),
        onCompleted: _onCompleted(model.setToken),
        builder: (RunMutation runMutation,QueryResult result){
          return  MaterialButton(
              onPressed: (){
                _submit();
                runMutation({'name':_name,'password':_password});
              },
              child: Text('Login'),
            );
        },
      ),
    );

  }
  _onCompleted(Function setToken)=>(QueryResult result){
   if(result.errors !=null){
     setState(() {
      _userNotFound =result.errors.toString().contains('User not found');
      _passwordNotFound = result.errors.toString().contains('Invalid password'); 
     });
   }
    else if(result.loading){
     debugPrint('Loading....');
   }
   else{
     setToken(result.data['signIn']['token']);
   Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
   }
   
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: Container(
              padding: EdgeInsets.only(top: 50.0),
              child: _loginForm(context), 
            ),
          ),
    );
  }
}