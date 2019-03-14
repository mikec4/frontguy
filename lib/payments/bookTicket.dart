import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BookTicket extends StatefulWidget {
 String name;
 String phoneNumber;

 BookTicket({@required this.name,@required this.phoneNumber});

  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
 



  @override
  Widget build(BuildContext context) {
    return Container(child: _dialog(),);

  }
  _dialog(){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
            title: Text('Book Ticket',style: TextStyle(fontFamily: 'Lato-Bold'),),
            actions: <Widget>[
              _buttons()
            ],
           titlePadding: EdgeInsets.only(left: 80.0,top: 20.0,bottom: 0.0),
            content: _passengerTicket(),
          );
      }
   );
  }

  _buttons(){
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10.0,
      children: <Widget>[
        Container(
          width: 80.0,
          height: 35.0,
          child: MaterialButton(
            textColor: Colors.white,
            color: Colors.grey,
            onPressed: (){},
            child: Text('Ahirisha'),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
          ),
        ),
        Container(
          width: 80.0,
          height: 35.0,
          child: MaterialButton(
            textColor: Colors.white,
            color: Colors.green,
            onPressed: (){},
            child: Text('Lipa'),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
          ),
        )
      ],
    );
  }
 _passengerTicket(){
   return Container(
     height: 172.0,
     child: ListView(
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
      Text('Bus name: ',
        style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w800)),
      Text('Fresta DPA T399',
        style: TextStyle(
            fontFamily: 'Lato-Thin'),)
        ,],
        );
 }
 _busRoute(){
   return Row(
     children: <Widget>[
       Text('Route:',
         style: TextStyle(
             fontWeight: FontWeight.w800,),),
       SizedBox(width: 10.0,),
       Text('Dar to Mwanza',style: TextStyle(
           fontFamily: 'Lato-Thin'),),
     ],
   );
 }
 _passengerName(){
   return Row(
     children: <Widget>[
       Text('Name:',
         style: TextStyle(fontWeight: FontWeight.w800),),
       SizedBox(width: 10.0,),
       Text(widget.name,
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }
 _passengerPhoneNumber(){
   return Row(
     children: <Widget>[
       Text('Phone number:',
         style: TextStyle(fontWeight:FontWeight.w800 ),),
       SizedBox(width: 10.0,),
       Text(widget.phoneNumber,
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }
 _passengerSeatNumber(){
   return Row(
     children: <Widget>[
       Text('Seat No:',
         style: TextStyle(fontWeight: FontWeight.w800),),
       SizedBox(width: 10.0,),
       Text('47',
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }

 _reportTime(){
   return Row(
     children: <Widget>[
       Text('Report time:',
         style: TextStyle(fontWeight: FontWeight.w800),
       ),
       SizedBox(width: 10.0,),
       Text('5:30 AM ',
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }

 _departTime(){
   return Row(
     children: <Widget>[
       Text('Departure:',
         style: TextStyle(fontWeight: FontWeight.w800),),
       SizedBox(width: 10.0,),
       Text('5:50 AM',
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }
 _busFare(){
   return Row(
     children: <Widget>[
       Text('Fare(TZS):',
         style: TextStyle(fontWeight: FontWeight.w800),),
       SizedBox(width: 10.0,),
       Text('40,000',
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }
 _fareTax(){
   return Row(
     children: <Widget>[
       Text('VAT (Included 18%):',
         style: TextStyle(fontWeight: FontWeight.w800),),
       SizedBox(width: 10.0,),
       Text('3,600',
         style: TextStyle(fontFamily: 'Lato-Thin'),),
     ],
   );
 }
}