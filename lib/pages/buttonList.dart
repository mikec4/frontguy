import 'package:flutter/material.dart';

import 'dropDown.dart';
import 'bookTicket.dart';

class ButtonList extends StatefulWidget {

  @override
  ButtonListState createState() {
    return new ButtonListState();
  }
}

class ButtonListState extends State<ButtonList> {
  bool _isColorChanged1;
  bool _isColorChanged2;

  String _initialValue;
  List<String> _items = ['Mpesa','Tigo Pesa','Airtel Money','Halopesa','T-pesa'];
  int _counter = 0;

  List<Widget> _buttons = new List<Widget>();

   Widget _button1(){
    return MaterialButton(
     color: !_isColorChanged1? Colors.green:Colors.red, 
    onPressed: !_isColorChanged1? _increment1: null,
      child: Text('Seat 1'),
    );
  }


  
  Widget _button2(){
    return MaterialButton(
      color: !_isColorChanged2? Colors.green:Colors.red, 
    onPressed: !_isColorChanged2? _increment2: null,
      child: Text('Seat 2'),
    );
  }

  Widget _button3(){
    return MaterialButton(
      color: Colors.green,
      onPressed: _dialog,
      child: Text('Button 3'),

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
  _dialog(){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          //contentPadding: EdgeInsets.all(30.0),
          title:Text('Book Ticket'),
          content:Container(
            height: 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _expansionTile1(),
                _expansionTile2(),
                Text('   Choose payment method',style:TextStyle(color:Colors.red,fontSize:19.0)),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40.0,),
                    DropDown(),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: (){},
              color: Colors.blue,
              child: Text('Cancel',style:TextStyle(color:Colors.white)),
            ),
            MaterialButton(
              onPressed: (){},
              child: Text('Pay',style:TextStyle(color:Colors.white)),
              color: Colors.blue,
            )
          ],
        ); 
      }
    );
  }

 
  _increment1(){
   
    setState(() {
     _isColorChanged1=true; 
     _counter ++;
    });
  }

  _increment2(){
    setState(() {
     _isColorChanged2 =true; 
    });
  }
  

  @override
  void initState() {
    super.initState();
    _isColorChanged1 = false;
    _isColorChanged2 = false;
    _buttons.add(_button1());
    _buttons.add(_button2());
  }

  @override
  Widget build(BuildContext context) {
    
    print('${_buttons.length}');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            _button1(),
            _button2(),
            _button3()
          ],
        )
      )
    );
  }
}


class MyPainter extends CustomPainter{
  Color color;
  MyPainter();
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.blue;
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