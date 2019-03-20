import 'package:flutter/material.dart';

import 'package:frontguy/boxPainter.dart';
import 'package:frontguy/payments/fillPayments/fillPayments.dart';

class Bus2 extends StatefulWidget {
  @override
  _Bus2State createState() => _Bus2State();
}

class _Bus2State extends State<Bus2> {
  bool _isColorChanged=false;

  String seatNumber = '60';


  
 
  @override
  Widget build(BuildContext context) {

    return _buttonList();
  }

  _button(){
    return MaterialButton(
      animationDuration: Duration(milliseconds: 1000),
      child: Text('seat $seatNumber'),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FillPayments(seatNumber: seatNumber,)));

        setState(() {
          _isColorChanged = true;
        });
      },
      color: _isColorChanged? Colors.red: Colors.green,
    );
  }

  _buttonList(){
    return SliverFixedExtentList(
        delegate: SliverChildListDelegate(<Widget>[
          _button()
        ]),
        itemExtent: 30.0);
  }
}



class BoxPainter extends CustomPainter{
  Color color;
  bool isColorChanged;
  BoxPainter({this.isColorChanged =false});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = isColorChanged? Colors.red : Colors.green;
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