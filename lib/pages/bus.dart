import 'package:flutter/material.dart';

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  CurvedAnimation curvedAnimation;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    
    controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    // curvedAnimation = new CurvedAnimation(parent: controller,curve: Curves.easeInOut);
    opacity =Tween<double>(begin: 0.1,end: 1.0).animate(controller)
    // animation =Tween<double>(begin: 0.0,end: 300.0).animate(curvedAnimation)
   ..addListener((){
     setState(() {
       
     });
   })
   ..addStatusListener((status){
     if(status ==AnimationStatus.completed || status ==AnimationStatus.dismissed){
       controller.reverse();
     }
     if(status ==AnimationStatus.dismissed){
       controller.forward();
     }
   });
   controller.forward();

  }

  @override
  void dispose() {
    controller.dispose();
    animation.removeListener((){});
    animation.removeStatusListener((listener){});
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _sliverList();
  }


_innerRow(){
  return Row(
    children: <Widget>[
    _customPaint(),_customPaint(),

    ], 
  );
}

_outerRow(){
  return Container(
    padding: EdgeInsets.only(left: 10.0,right: 5.0),
    child: Row(
      children: <Widget>[
        _innerRow(),SizedBox(width: 77.0,),_innerRow()
      ],
    ),
  );

}

_outerColumn(){
  return ListView(
    children: <Widget>[
      _driverSeat(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _backSeats()
    ],
  );
}


_sliverList(){
  return SliverFixedExtentList(

    itemExtent: 40.0,
    delegate: SliverChildListDelegate([
      Padding(padding: EdgeInsets.only(top: 20.0),),
      _driverSeat(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _outerRow(),_outerRow(),
      _backSeats()
      ]),
  );
}

 _driverSeat(){
   return Padding(
     padding: EdgeInsets.only(left: 10.0),
     child: Row(
       children: <Widget>[
         SizedBox(width: 77.0,height: 90.0,),
         SizedBox(width: 77.0,height: 90.0,),
         SizedBox(width: 77.0,height: 90,),
         SizedBox(width: 77.0,height: 90.0,),
         _customPaint()
       ],
     ),
   );
 }
_backSeats(){
  return Padding(
    padding: EdgeInsets.only(left: 10.0),
    child: Row(
      children: <Widget>[
        _customPaint(),_customPaint(),
        _customPaint(),_customPaint(),
        _customPaint()
      ],
    ),
  );
}
 
 _customPaint(){
   return InkWell(
     onTap: (){},
     child: Opacity(
       opacity: opacity.value,
       child: Container(
         width: 77.0,
         height: 90.0,
         child: CustomPaint(
           painter: BoxSeat(),),
         ),
     ),
   );
 }
}

class BoxSeat extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.green;
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