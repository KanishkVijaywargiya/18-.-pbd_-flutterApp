import 'package:flutter/material.dart';
import 'package:pbd/utils/data.dart';
import 'package:pbd/utils/utils.dart';


class corporateExperiencepage extends StatefulWidget {
  @override
  _corporateExperiencepageState createState() => _corporateExperiencepageState();
}

/* ===  corporate experience page bottom nav. === */
class _corporateExperiencepageState extends State<corporateExperiencepage> {

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
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF696D77), Color(0xFF292C36)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'App Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(18.0, context),
              fontFamily: 'AvenirLTStd-Light'
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // ProductScreenTopPart(),
              ProductScreenBottomPart(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'AvenirLTStd-Light',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              title: Text(
                'Gallery',
                style: TextStyle(
                  fontFamily: 'AvenirLTStd-Light',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text(
                'Contact',
                style: TextStyle(
                  fontFamily: 'AvenirLTStd-Light',
                ),
              ),
            )
          ],
          currentIndex: _selectionIndex,
          selectedItemColor: Color(0xFFE83350),
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTap: _onItemTapped,
        ),
      ),
    );  
  }
}
/* ===  corporate experience page bottom nav ends here. === */


/* ===  corporate experience page product screen bottom part. === */
class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      new _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18.0, context),
            ),
            child: Text(
              "Corporate Experience",
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(23.0, context),
                fontFamily: 'AvenirLTStd-Light'
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              corporateExperienceOne,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEAF0F1),
                fontSize: screenAwareSize(20.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Core Team Members',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEAF0F1),
                fontSize: screenAwareSize(20.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
          
          /** core team members gallery **/



          

          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(30.0, context),
              bottom: screenAwareSize(30.0, context),
              left: screenAwareSize(55.0, context)
            ),
            child: MaterialButton(
              // minWidth: double.infinity,
              color: Color(0xFFEAF0F1),
              onPressed: () => Navigator.of(context).pushNamed("/d"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              splashColor: Color(0xFF2F363F),
              child: Text(
                'For more details mail us on\nprasadbidapainstitute@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 3.0,
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
/* ===  corporate experience page product screen bottom part ends here. === */
