import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pbd/widgets/CustomShapeClipper.dart';
import 'package:pbd/widgets/models.dart';
import 'package:pbd/widgets/slide_item.dart';
import 'package:pbd/widgets/categories.dart';
import 'package:pbd/utils/utils.dart';

// class ModelGallery extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Gallery',
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           child: Icon(Icons.arrow_back_ios),
//           onTap: () => Navigator.pop(context),
//         ),
//       ),
//     );
//   }
// }

class modelGalleryPage extends StatefulWidget {
  @override
  _modelGalleryPageState createState() => _modelGalleryPageState();
}

/* ===  model gallery page bottom nav part. === */
class _modelGalleryPageState extends State<modelGalleryPage> {

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
            'Gallery',
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
              galleryListTopPart,
              SizedBox(height: 20.0,),
              galleryListBottomPart()
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
/* ===  model gallery page bottom nav part ends here. === */


/* === model Gallery page horizontal card listView. === */
var galleryListTopPart = Container(
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
/* ===  model Gallery page horizontal card listView ends here. === */


/* ===  galleryListBottom page Product Screen Bottom Part. === */
class galleryListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Prasad Bidapa Associates',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontSize: screenAwareSize(13.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              galleryCard(),
              galleryCard(),
              galleryCard(),
              galleryCard(),
              galleryCard(),
              galleryCard(),
            ],
          ),
        ],
      ),
    );
  }
}
/* ===  galleryListBottom page Product Screen Bottom Part ends here. === */

/* ===  galleryListBottom page gallery card. === */
class galleryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            height: 106.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
              border: Border.all(color: Color(0xFFE83350)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF696D77), 
                  Color(0xFF292C36),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Model Name 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Wrap(
                        children: <Widget>[
                          SizedBox(width: 40.0,)
                        ],
                      ),
                      Text(
                        'Katrina Kaif',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: <Widget>[
                      galleryCardDetail(Icons.flag, "Indian"),
                      galleryCardDetail(Icons.star, '4.4'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Icon(Icons.favorite, color: Color(0xFFE83350),),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          )
        ],
      ),
    );
  }
}
/* ===  galleryListBottom page gallery card ends here. === */


/* ===  galleryListBottom page gallery card detail. === */
class galleryCardDetail extends StatelessWidget {

  final IconData iconData;
  final String label;

  galleryCardDetail(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(

      label: Text(label),
      labelStyle: TextStyle(color: Colors.white, fontSize: 14.0),
      avatar: Icon(iconData),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0),),
      ),
    );
  }
}
/* ===  galleryListBottom page gallery card detail ends here. === */
