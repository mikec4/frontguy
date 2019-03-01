import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Tester extends StatefulWidget {
  @override
  _TesterState createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  String posts = """
  query {
    getAllPosts{
      title
      user{
        name
      }
    }
  }
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tester'),
      ),
      body: Container(
        child: Query(
          options: QueryOptions(
            document: posts
          ),
          builder: (QueryResult result){
            if(result.errors!=null) return Text(result.errors.toString());
            
            if(result.loading) return Text('Loading...');

            List myPosts =result.data['getAllPosts'];
            print('Posts : $myPosts');

            return ListView.builder(
              itemCount: myPosts.length,
              itemBuilder: (context, i){
                final post =myPosts[i];
                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['user']['name']),);
              },
            );

          },
        ),
      ),
    );
  }
}