import 'package:flutter/material.dart';

class BusSeat extends StatefulWidget {
  @override
  _BusSeatState createState() => _BusSeatState();
}

class _BusSeatState extends State<BusSeat> {
  bool _onSeatPressed = false;
  bool _onColorChange = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seat'),),
      body: Align(
        alignment: Alignment.center,
        child: AbsorbPointer(
          absorbing: _onColorChange,
          child: MaterialButton(
            onPressed: (){
              if(!_onColorChange){
              setState(() {
                _onColorChange = true;
              });}

            },
            color:_onColorChange?  Colors.red: Colors.cyan,
            child: Text('Seat No'),
          ),
        ),
      ),
    );
  }
}







class SeatPainter extends CustomPainter{
  Color color;
  SeatPainter({this.color});

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