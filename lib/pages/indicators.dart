import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CustomIndicators extends StatefulWidget {
  @override
  _CustomIndicatorsState createState() => _CustomIndicatorsState();
}

class _CustomIndicatorsState extends State<CustomIndicators> {
  @override
  Widget build(BuildContext context) {
    return _indicators();

  }

  _indicators(){
    return SpinKitFadingCircle(
          duration: Duration(milliseconds: 2000),
          size: 60.0,
          itemBuilder: (context, i){
            return DecoratedBox(
              decoration: BoxDecoration(
                color: i.isEven ? Colors.pink: Colors.black
              ),
            );
          },
        );
        }
}