import 'package:flutter/material.dart';
import 'package:Turista/models/tourEvent.dart';
import 'package:Turista/pages/main_page.dart';
import 'package:Turista/pages/card_deck_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 25, 25, 25)
    ));
    return MaterialApp(
      title: 'Turista',

      theme: ThemeData(
        accentColor: Color.fromARGB(255, 25, 25, 25),
        primaryColor: Color.fromARGB(255, 25, 25, 25),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 48
        ),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          title: TextStyle(fontFamily: 'ReemKufi', fontSize: 20, letterSpacing: 9, color: Colors.white),
          body1: TextStyle(fontFamily: 'ReemKufi' , color: Colors.white,fontSize: 33),
          body2: TextStyle(fontFamily: 'Rajdhani',color: Colors.white,fontSize: 22,letterSpacing: 2),
        ).apply(
          displayColor: Colors.white
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    //return CardDeckPage(title: "Night Life",);
    return MainPage();
  }
}
