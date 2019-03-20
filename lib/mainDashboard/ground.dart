import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
as CalendarCarousel;
import 'dart:async';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';



class Ground extends StatefulWidget {
  @override
  _GroundState createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  String _newValue = '';
  DateTime _currentDate = DateTime.now();

  EventList<Event> _markedCap = new EventList<Event>(
    events: {
      DateTime.now(): [
        Event(
            date: DateTime(2019,5,10),
            title: 'My birthday',
            icon: Icon(Icons.cake)),
        Event(
            date: DateTime(2019,10,10),
            title: 'My birthdat',
            icon: Icon(Icons.cake))
      ]
    }
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: CalendarCarousel.CalendarCarousel<Event>(
          width: 400,
          height: 400,
          
          showHeaderButton: true,
          markedDateIconBuilder: (event){
            return Text(event.title);
          },
          showHeader: true,
          selectedDateTime: _currentDate,
          selectedDayButtonColor: Colors.pink,
          todayButtonColor: Colors.blue,
          headerText: Text('Book a ticket'),
          markedDatesMap: _markedCap,
          onDayPressed: (date,List<Event> events){
            this.setState(() {
              _currentDate = date;
            });
          },
        )
      ),
    );
  }

}
