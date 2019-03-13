import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bookTicket(),
    );
  }
  _expansionTile1(){
    List<String> names = ['Own name','Other name'];
    return ExpansionTile(
      title: Text('Fill names',style:TextStyle(color: Colors.red,fontSize:19.0)),
      children: names.
      map((val)=> 
      ListTile(title: Text(val),)).toList(),
    );
  }
  _expansionTile2(){
    List<String> phoneNumber = ['Own number','Other number'];
    return ExpansionTile( 
      title: Text('Phone number',style: TextStyle(color: Colors.red,fontSize:19.0),),
      children: phoneNumber.
      map((String val)=> 
      ListTile(title: Text(val,),)).toList(),
    );
  }

  _paymentMethods(){
    return Text(
              '  * Choose payment methods*',
              style:TextStyle(
                color: Colors.red,
                fontSize: 19.0));
  }
 _bookButtons(){
   return  Row(
              children: <Widget>[
                SizedBox(width: 155.0,),
                MaterialButton(
                  onPressed: (){},
                  child: Text(
                    'Cancel',
                    style:TextStyle(
                      color: Colors.white)),
                  color: Colors.blue,
                ),
                SizedBox(width: 20.0,),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text(
                    'Done',
                    style:TextStyle(
                      color: Colors.white
                    )),
                )
              ],
              );
 }

 _dropDownRow(){
   return  Row(
              children: <Widget>[
                SizedBox(width: 94.0,),
              ]);
 }
  _bookTicket(){
    return Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            _expansionTile1(),
            SizedBox(height: 10.0,),
            _expansionTile2(),
            SizedBox(height: 10.0,),
            _paymentMethods(),
            SizedBox(height: 10.0,),
            _dropDownRow(),
            SizedBox(height: 6.0,),
           _bookButtons()
          ],
          ),
      );
  }
}