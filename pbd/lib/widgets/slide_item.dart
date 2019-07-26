import 'package:flutter/material.dart';

class SlideItem extends StatefulWidget {

  final String img;
  final String title;
  final String address;
  final String rating;

  SlideItem(
    {
      Key key,
      @required this.img,
      @required this.title,
      @required this.address,
      @required this.rating,
    }
  ) : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }
}