import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _name="";
  String _password ="";

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
  Widget _signUpForm(){
    return Container(
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Your name'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: 'Your password'),
          ),
          _signUpButton()
        ],
      ),
    );
  }
  Widget _signUpButton(){
    String credentials = """
    mutation CreateUser(\$name:String!,\$password:String!){
      createUser(name:\$name,password:\$password){
        name
      }
    }
    """;
    return Mutation(
        options: MutationOptions(document: credentials),
        builder: (RunMutation runMutation,QueryResult result){
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text('SignUp'),
      onPressed:()=> runMutation({'name':_name,'password':_password}),
      textTheme: ButtonTextTheme.primary,
    );
        },
        onCompleted: _onCompleted,
      );
  }
  _onCompleted(QueryResult result){
    if(result.errors!=null) debugPrint(result.errors.toString());
    if(result.loading) debugPrint('Loading....');
    debugPrint('Name $_name');
    debugPrint('Password $_password');
    debugPrint('Success ${result.data}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body:_signUpForm() 
    );
  }
}