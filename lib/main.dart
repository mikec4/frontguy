import 'package:flutter/material.dart';
import 'package:frontguy/form/home.dart';
import 'package:frontguy/form/phone.dart';
import 'package:frontguy/form/signUp.dart';
import 'package:frontguy/mainDashboard/calendarPage.dart';
import 'package:frontguy/mainDashboard/ground.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'appModel.dart';
import 'tester.dart';
import 'register.dart';
import 'dashboard.dart';
import 'textFields.dart';
import 'forms.dart';
import './pages/landingPage.dart';
import './pages/product.dart';
import './pages/cardList.dart';
import './pages/bus.dart';
import './pages/bus2.dart';
import './pages/buttonList.dart';
import './pages/expansionPanel.dart';
import './pages/panelDropdown.dart';
import 'package:frontguy/payments/fillPayments/fillPayments.dart';
import './payments/bookTicket.dart';
import './payments/screen.dart';
import 'busSeat.dart';
import './pages/product2.dart';
import './form/login.dart';

void main() => runApp(
  ScopedModel<AppModel>(
    model: AppModel(),
    child: ScopedModelDescendant<AppModel>(
      builder: (context,child,model)=>MyApp(token: model.token),
    ),
  ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String token;
  final String graphqlUri = "https://apollo-app1.herokuapp.com/graphql";
  MyApp({this.token});
  
  @override
  Widget build(BuildContext context) {
    HttpLink link;
   if(token ==null){
     link = new HttpLink(uri: graphqlUri);
   }
   link = new HttpLink(
     uri: graphqlUri,
     headers: {"authorization":"$token"}
   );

    String typenameDataIdFromObject(Object object) {
      if (object is Map<String, Object> &&
       object.containsKey('__typename') &&
       object.containsKey('id')) {
    return "${object['__typename']}/${object['id']}";
  }
  return null;
}
    ValueNotifier<GraphQLClient> client =ValueNotifier(
    GraphQLClient(
      cache: NormalizedInMemoryCache(
        dataIdFromObject: typenameDataIdFromObject
      ),
      link: link));

    return GraphQLProvider(
      client: client,
      child: MaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //fontFamily: 'Lato'
        ),

//         initialRoute: '/landingPage',
//         routes: {
//           '/landingPage':(context)=>LandingPage(),
//           '/product2':(context) => Product2(),
//           '/fillPayments':(context) => FillPayments()
//        },
        home:Ground()
      ),
    );
  }
}