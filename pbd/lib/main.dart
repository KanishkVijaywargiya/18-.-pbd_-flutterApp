import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbd/screens/HomePage.dart';
import 'package:pbd/screens/associatePage.dart';
import 'package:pbd/screens/modelManagementPage.dart';
import 'package:pbd/screens/modelDetailPage.dart';
import 'package:pbd/screens/modelGalleryPage.dart';
import 'package:pbd/screens/modelInstitutePage.dart';
import 'package:pbd/screens/coursesPage.dart';
import 'package:pbd/screens/corporateExperiencePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'App Name',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: associatePage(),
      routes: <String, WidgetBuilder>{
        "/a" : (BuildContext context) => HomePage(),
        "/b" : (BuildContext context) => associatePage(),
        "/c" : (BuildContext context) => modelManagementPage(),
        "/d" : (BuildContext context) => modelGalleryPage(),
        "/e" : (BuildContext context) => modelDetailPage(),
        "/f" : (BuildContext context) => modelInstitutePage(),
        "/g" : (BuildContext context) => coursesPage(),
        "/h" : (BuildContext context) => corporateExperiencepage(),
      },
    );
  }
}