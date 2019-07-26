import 'package:flutter/material.dart';

class modelDetailPage extends StatefulWidget {
  @override
  _modelDetailPageState createState() => _modelDetailPageState();
}

/* ===  model detail page bottom nav part. === */
class _modelDetailPageState extends State<modelDetailPage> {

  //bottom nav codes
  int _selectionIndex = 0;
  static const TextStyle optionStyle = 
      TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      );
      static const List<Widget> _widgetOptions =
          <Widget>[
            Text(
              'Index 0: Home',
              style: optionStyle,
            ),
            Text(
              'Index 1: Gallery',
              style: optionStyle,
            ),
            Text(
              'Index 2: Contacts',
              style: optionStyle,
            ),
          ];

          void _onItemTapped(int index){
            setState(() {
              _selectionIndex = index;
            });
          }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
/* ===  model detail page bottom nav part ends here. === */
