import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BookTicket extends StatefulWidget {
  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: _dialog,
          child: Text('bookTicket'),
          color: Colors.red,
        ),
      ),
    );
  }
  _dialog(){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
            title: Text('Book Ticket'),
            actions: <Widget>[
              MaterialButton(
                child: Text('Confirm'),
                onPressed: (){},
                color: Colors.greenAccent,
              )
            ],
           titlePadding: EdgeInsets.only(left: 80.0,top: 20.0,bottom: 0.0),
            content: _passengerTicket(),
          );
      }
    );
  }
 
 _passengerTicket(){
   return Container(
     height: 172.0,
     child: Column(
       children: <Widget>[
       _busName(),
       _busRoute(),
       _passengerName(),
       _passengerPhoneNumber(),
       _passengerSeatNumber(),
       _busFare(),
       _reportTime(),
       _departTime(),
       _fareTax()
       ],
     ),
   );
 }
 _busName(){
   return Row(
    children: <Widget>[
      Text('Bus name: ',style: TextStyle(fontSize: 17.0,fontFamily: 'Roboto-Medium'),),
      Text('Fresta DPA T399')
        ,],
        );
 }
 _busRoute(){
   return Row(
     children: <Widget>[
       Text('Route:',style: TextStyle(fontFamily: 'Roboto-Medium'),),
       SizedBox(width: 10.0,),
       Text('DAR TO MWANZA'),
     ],
   );
 }
 _passengerName(){
   return Row(
     children: <Widget>[
       Text('Name:',style: TextStyle(fontFamily: 'Roboto-Bold'),),
       SizedBox(width: 10.0,),
       Text('MICHAEL NTIRINIGA'),
     ],
   );
 }
 _passengerPhoneNumber(){
   return Row(
     children: <Widget>[
       Text('Phone number:',style: TextStyle(fontFamily: 'Roboto-Medium'),),
       SizedBox(width: 10.0,),
       Text('0715165569'),
     ],
   );
 }
 _passengerSeatNumber(){
   return Row(
     children: <Widget>[
       Text('Seat No:',style: TextStyle(fontFamily: 'Roboto-Medium'),),
       SizedBox(width: 10.0,),
       Text('47'),
     ],
   );
 }

 _reportTime(){
   return Row(
     children: <Widget>[
       Text('Report time:'),
       SizedBox(width: 10.0,),
       Text('5:30 AM '),
     ],
   );
 }

 _departTime(){
   return Row(
     children: <Widget>[
       Text('Departure:'),
       SizedBox(width: 10.0,),
       Text('5:50 AM'),
     ],
   );
 }
 _busFare(){
   return Row(
     children: <Widget>[
       Text('Fare(TZS):'),
       SizedBox(width: 10.0,),
       Text('40,000'),
     ],
   );
 }
 _fareTax(){
   return Row(
     children: <Widget>[
       Text('VAT 18%:'),
       SizedBox(width: 10.0,),
       Text('3,600'),
     ],
   );
 }
}