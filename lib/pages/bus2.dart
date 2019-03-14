import 'package:flutter/material.dart';

import 'package:frontguy/boxPainter.dart';

class Bus2 extends StatefulWidget {
  @override
  _Bus2State createState() => _Bus2State();
}

class _Bus2State extends State<Bus2> {
  bool _isColorChanged=false;
  int _buttonCount= 0;

  List<Widget> texts = new List<Widget>();
 

  
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i){
         return RaisedButton(
           onPressed: (){
             setState(() {
              _isColorChanged = true; 
             });
           },
           color: _isColorChanged==true? Colors.green:Colors.pink,
         );
        },
      ),
    );
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