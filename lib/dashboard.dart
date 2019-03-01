import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String myPosts = """
  query{
    getPosts{
      title
    }
  }
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Container(
        child: Query( 
          options: QueryOptions(
            document: myPosts
          ),
        builder: (QueryResult result){
          if(result.errors !=null) return Text(result.errors.toString());
          if(result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          List posts = result.data['getPosts'];
          return ListView.builder(
           itemCount: posts.length,
           itemBuilder: (context,i){
           final post = posts[i];
           return ListTile(
             title: Text(post['title']),
           );
           },
          );
        },
        ),
      ),
      drawer: Drawer(),
    );
  }
}