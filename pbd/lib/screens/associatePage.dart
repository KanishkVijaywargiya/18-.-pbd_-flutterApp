import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pbd/screens/corporateExperiencePage.dart';
import 'package:pbd/screens/modelGalleryPage.dart';
import 'package:pbd/utils/utils.dart';


class associatePage extends StatefulWidget {

  associatePage
  (
    {
      Key key
    }
  ) : super(key: key);

  @override
  _associatePageState createState() => _associatePageState();
}

/* ===  Bottom Nav codes. === */
class _associatePageState extends State<associatePage> {

  //bottom nav codes
  int _selectionIndex = 0;

  static const TextStyle optionStyle = 
      TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      );
      final _pageOptions = [
        associatePage(),
        modelGalleryPage(),
        corporateExperiencepage(),
      ];
          // <Widget>[
          //   Text(
          //     'Index 0: Home',
          //     style: optionStyle,
          //   ),
          //   Text(
          //     'Index 1: Gallery',
          //     style: optionStyle,
          //   ),
          //   Text(
          //     'Index 2: Contacts',
          //     style: optionStyle,
          //   ),
          // ];

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
          tileMode: TileMode.clamp,
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
              ProductScreenTopPart(),
              ProductScreenBottomPart(),
            ],
          ),
        ),
        // body: _pageOptions[_selectionIndex],
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
                )
              ),
            ),
          ],
          currentIndex: _selectionIndex,
          selectedItemColor: Color(0xFFE83350),
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTap: (int index){
            setState(() {
              _selectionIndex = index;
            });
          },
        ),
      ),
    );
  }
}
/* ===  Bottom Nav codes ends here. === */


/* ===  associate Product screen top part. === */
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
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed("/a"),
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
/* ===  associate Product screen top part ends here. === */


/* ===  associate Product screen bottom part. === */
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(20.0, context),
              top: screenAwareSize(60.0, context),
            ),
            child: Text(
              "Prasad Bidapa",
              style: TextStyle(
                color: Color(0xFF949598),
                letterSpacing: 8.0,
                fontSize: screenAwareSize(25.0, context),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'AvenirLTStd-Light'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(50.0, context),
            ),
            child: Text(
              "Associates",
              style: TextStyle(
                letterSpacing: 8.0,
                color: Color(0xFF949598),
                fontSize: screenAwareSize(25.0, context),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'AvenirLTStd-Light'
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(60.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenAwareSize(2.0, context),
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context)
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: RaisedButton(
                        color: Color(0xFFEAF0F1),
                        onPressed: () => Navigator.of(context).pushNamed("/c"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        splashColor: Color(0xFF2F363F),
                        child: Text(
                          "Model\nManagement",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 3.0,
                            fontSize: 15.0,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: RaisedButton(
                        color: Color(0xFFEAF0F1),
                        onPressed: () => Navigator.of(context).pushNamed("/f"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        splashColor: Color(0xFF2F363F),
                        child: Text(
                          'Model\nInstitute',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 4.0,
                            fontSize: 15.0,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
/* ===  associate Product screen bottom part ends here. === */


Widget colorItem(Color color, bool isSelected, BuildContext context, VoidCallback _ontab){
  return GestureDetector(
    onTap: _ontab,
  );
}
