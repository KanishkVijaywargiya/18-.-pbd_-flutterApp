import 'package:flutter/material.dart';
import 'package:pbd/utils/data.dart';
import 'package:pbd/utils/utils.dart';


class modelInstitutePage extends StatefulWidget {
  @override
  _modelInstitutePageState createState() => _modelInstitutePageState();
}

/* ===  model institute page bottom nav part. === */
class _modelInstitutePageState extends State<modelInstitutePage> {

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
/* ===  model institute page bottom nav part ends here. === */

/* ===  model institute page product screen top part. === */
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
/* ===  model institute page product screen top part ends here. === */


/* ===  model institute page product screen bottom part. === */
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
              top: screenAwareSize(20.0, context)
            ),
            child: Text(
              "Prasad Bidapa Institute",
              style: TextStyle(
                letterSpacing: 6.0,
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
                modelInstitute,
                textAlign: TextAlign.left,
                maxLines: 11,
                style: TextStyle(
                 color: Colors.white,
                 fontSize: screenAwareSize(21.0, context),
                 fontFamily: 'AvenirLTStd-Light'
                ),
              ),
              secondChild: Text(
                modelInstitute,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(21.0, context),
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
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(18.0, context),
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context),
              bottom: screenAwareSize(10.0, context)
            ),
            child: Text(
              modelInstituteTwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenAwareSize(17.0, context),
                fontFamily: 'AvenirLTStd-Light',
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context)
            ),
            child: Text(
              modelInstituteThree,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: screenAwareSize(17.0, context),
                fontFamily: 'AvenirLTStd-Light',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(30.0, context),
              bottom: screenAwareSize(30.0, context),
              left: screenAwareSize(55.0, context)
            ),
            child: MaterialButton(
              // minWidth: double.infinity,
              color: Color(0xFFEAF0F1),
              onPressed: () => Navigator.of(context).pushNamed("/g"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              splashColor: Color(0xFF2F363F),
              child: Text(
                'View Courses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 6.0,
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/* ===  model institute page product screen bottom part ends here. === */


Widget colorItem(Color color, bool isSelected, BuildContext context, VoidCallback _ontab){
  return GestureDetector(
    onTap: _ontab,
  );
}
