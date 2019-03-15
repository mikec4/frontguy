import 'package:flutter/material.dart';
import './Passenger.dart';


class Ticket extends StatefulWidget {
// final String name;
// final String phoneNumber;
 final Passenger passenger;

  Ticket({this.passenger});

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ticket',
        style: TextStyle(fontStyle: FontStyle.italic),),),
      body: _busTicket()
    );
  }

  _busTicket(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _busName(),
          _busRoute(),
          _reportTime(),
          _departTime(),
          _busStand(),
          _arrivalTime(),
          Padding(
            padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
            child: _drawLine(),),
          _passengerName(),
          _passengerPhoneNumber(),
          _seatNo(),
          _busFare(),
          _busVAT(),
          _ticketId(),
          Padding(
            padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
            child: _drawLine(),),
          _buttons()
        ],
      ),
    );
  }
  _buttons(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        direction: Axis.horizontal,
        children: <Widget>[
          _paintCancelButton(),
          _paintConfirmButton()

        ],
      ),
    );
  }

  _paintConfirmButton(){
    return Container(
      width: 140.0,
      height: 45.0,
      child: CustomPaint(
        painter: new BoxPainter(color: Colors.green),
        child: MaterialButton(
          onPressed: (){},
          child: Text('Confirm',
            style: TextStyle(
                fontSize: 18.0,color: Colors.black),),
//
        ),
      ),
    );
  }

  _paintCancelButton(){
    return Container(
      width: 140.0,
      height: 45.0,
      child: CustomPaint(
        painter: new BoxPainter(color: Colors.red),
        child: MaterialButton(
          onPressed: (){},
          child: Text('Cancel',
            style: TextStyle(
                fontSize: 18.0,color: Colors.black),),
//
        ),
      ),
    );
  }
  _buttonCancel(){
    return Container(
      width: 140.0,
      height: 45.0,
      child: MaterialButton(
        onPressed: (){},
        child: Text('Cancel',
          style: TextStyle(
              fontSize: 18.0,color: Colors.white),),
        color: Colors.grey,
      ),
    );
  }

  _buttonConfirm(){
    return Container(
      width: 140.0,
      height: 45.0,
      child: MaterialButton(
        onPressed: (){},
        child: Text('Confirm',
          style: TextStyle(
              fontSize: 18.0,color: Colors.white),),
        color: Colors.green,
      ),
    );
  }

  _drawLine(){
    return Container(
      height: 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black,Colors.black],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: [1.0,1.0],
        )
      ),
    );
  }


 _busName(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Bus name:',
          style: TextStyle(
            fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('Fresta DPA T399',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
 }

  _busRoute(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Route:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('Dar to Mwanza',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _reportTime(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Report At:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('5:30 AM',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _departTime(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Depart At:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('5:50 AM',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _arrivalTime(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Arriving At:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('10:01 PM',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _busStand(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Location:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('Sinza shekilango',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _passengerName(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Passenger name:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text(widget.passenger.getName,
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _passengerPhoneNumber(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Phone number:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text(widget.passenger.getPhoneNumber,
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _seatNo(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Seat number:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('47',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _ticketId(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('TicketId:',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('ajdkalaldklalal',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _busFare(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('Bus Fare (tshs):',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text(widget.passenger.getAmount,
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }

  _busVAT(){
    return Wrap(
      spacing: 20.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Text('VAT (Included 18%):',
          style: TextStyle(
              fontFamily: 'Robot-Bold',fontSize: 19.0),),
        Text('3,600',
            style:TextStyle(fontSize: 19.0,fontFamily: 'Roboto-Thin'))
      ],
    );
  }
}




class BoxPainter extends CustomPainter{
  Color color;
  BoxPainter({this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = this.color;
    paint.strokeWidth = 3.0;
    paint.style=PaintingStyle.stroke;
    paint.strokeCap =StrokeCap.round;


    Rect rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawRect(rect, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}