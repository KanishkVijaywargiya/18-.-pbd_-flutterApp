import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pbd/screens/associatePage.dart';
import 'package:pbd/screens/corporateExperiencePage.dart';
import 'package:pbd/screens/modelGalleryPage.dart';
import 'package:pbd/utils/data.dart';
import 'package:pbd/utils/utils.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

/* ===  Home page bottom nav part. === */
class _HomePageState extends State<HomePage> {

  //bottom nav codes
  int _selectionIndex = 0;
  // static const TextStyle optionStyle = 
  //     TextStyle(
  //       fontSize: 30.0,
  //       fontWeight: FontWeight.bold
  //     );
      // final List<Widget> _widgetOptions =
      //     <Widget>[
      //       Text(
      //         'Index 0: Home',
      //         style: optionStyle,
      //       ),
      //       Text(
      //         'Index 1: Gallery',
      //         style: optionStyle,
      //       ),
      //       Text(
      //         'Index 2: Contacts',
      //         style: optionStyle,
      //       ),
      //     ];
  final List<Widget> _options = [associatePage(), modelGalleryPage(), corporateExperiencepage()];
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
              // body: _pageOptions[_selectionIndex],
              ProductScreenTopPart(),
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
/* ===  Home page bottom nav part ends here. === */


/* ===  Home page product screen top part. === */
class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: screenAwareSize(10.0, context)
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/adidas.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/* ===  Home page product screen top ends here. === */


/* ===  Home page product screen bottom part. === */
class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      new _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList.add(colorItem(colors[i], i == currentColorIndex, context, (){
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
  }
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
              top: screenAwareSize(20.0, context),
            ),
            child: Text(
              "Prasad Bidapa",
              style: TextStyle(
                letterSpacing: 5.0,
                color: Color(0xFF949598),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: screenAwareSize(28.0, context),
                fontFamily: 'AvenirLTStd-Light'
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(15.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(2.0, context),
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context)
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                textAlign: TextAlign.left,
                maxLines: 7,
                style: TextStyle(
                  wordSpacing: 4.0,
                  color: Colors.white,
                  fontSize: screenAwareSize(20.0, context),
                  fontFamily: 'AvenirLTStd-Light'
                ),
              ),
              secondChild: Text(
                desc,
                textAlign: TextAlign.left,
                style: TextStyle(
                  wordSpacing: 4.0,
                  color: Colors.white,
                  fontSize: screenAwareSize(18.0, context),
                  fontFamily: 'AvenirLTStd-Light'
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context)
            ),
            child: GestureDetector(
              onTap: _expand,
              child: Text(
                isExpanded ? "less" : "more..",
                style: TextStyle(
                  color: Color(0xFFFB382F),
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/* ===  Home page product screen bottom part ends here. === */


Widget colorItem(Color color, bool isSelected, BuildContext context, VoidCallback _ontab){
  return GestureDetector(
    onTap: _ontab,
  );
}