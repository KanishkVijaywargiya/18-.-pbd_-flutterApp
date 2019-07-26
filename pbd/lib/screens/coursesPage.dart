import 'package:flutter/material.dart';
import 'package:pbd/utils/data.dart';
import 'package:pbd/utils/utils.dart';
import 'package:pbd/widgets/CustomShapeClipper.dart';


class coursesPage extends StatefulWidget {
  @override
  _coursesPageState createState() => _coursesPageState();
}


/* ===  Bottom nav codes written. === */
class _coursesPageState extends State<coursesPage> {

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
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ProductScreenTopPart(),
              ProductsScreenBottomPart,
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


/* === course page Product Screen Top Part. === */
class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 230.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF696D77), 
                  Color(0xFF292C36),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'Transformative Experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontSize: screenAwareSize(28.0, context),
                    fontFamily: 'AvenirLTStd-Light',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
/* === course page Product Screen Top Part Ends Here. === */


/* === course page horizontal card listView. === */
var ProductsScreenBottomPart = Container(
  child: Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Courses available',
              style: TextStyle(
                color: Color(0xFFEAF0F1),
                fontSize: 18.0,
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 210.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: courseCards,
        )
      ),
    ],
  ),
);

List<courseCard> courseCards = [
  courseCard("assets/adidas.png", "Face and Hair", ""),
  courseCard("assets/adidas.png", "Body and Fitness", ""),
  courseCard("assets/adidas.png", "Mind and Soul", ""),
  courseCard("assets/adidas.png", "Wardrobe and Styling", ""),
];

class courseCard extends StatelessWidget {

  final String imagePath, courseName, monthYear;

  courseCard(
    this.imagePath,
    this.courseName,
    this.monthYear,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 210.0,
              width: 160,
              child: Image.asset(
                imagePath, 
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              height: 80.0,
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0.1)],
                  )
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        courseName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/* ===  course page horizontal card listView ends here. === */


/* ===  course page Product Screen Bottom Part. === */
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
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(20.0, context),
              bottom: screenAwareSize(10.0, context),
            ),
            child: Text(
              'This is an intense and immersive course for 3 days a week for a 4 week period',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEAF0F1),
                fontSize: screenAwareSize(15.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Change your look and Change your Life With the Prasad Bidapa Program",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEAF0F1),
                fontWeight: FontWeight.bold,
                fontSize: screenAwareSize(15.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/* ===  course page Product Screen Bottom Part ends here. === */

