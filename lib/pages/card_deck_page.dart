import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Turista/models/tourEvent.dart';
import 'package:Turista/widgets/custom_top_bar.dart';
import 'package:Turista/widgets/swipe_card.dart';

class CardDeckPage extends StatefulWidget {
  final String title;
  final List<TourEvent> deck;


  CardDeckPage({this.title, this.deck});

  @override
  _CardDeckPageState createState() => _CardDeckPageState(title : this.title, deck : this.deck);
}

class _CardDeckPageState extends State<CardDeckPage> {
  String title;
  List<TourEvent> deck;

  _CardDeckPageState({this.title,this.deck});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: //AppBar(
//
//        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){},),
//        title: Text(this.title,style: Theme.of(context).textTheme.title,),
//        centerTitle: true,
//        elevation: 0,
//      ),
      CustomTopBar(
        padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 48,),
        ),
        trail: IconButton(
          onPressed: (){},
          icon: Icon(Icons.more_vert, size: 48,),
        ),
        title: Text(this.title,style: Theme.of(context).textTheme.title,),
      ),
      backgroundColor: Theme.of(context).accentColor ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 30),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return SwipeCard(index);
          },
          itemCount: 3,
          viewportFraction: 0.87,
          itemWidth: double.infinity,
          itemHeight: double.infinity,
          scale: 0.9,
        )
      ),
    );
  }
}
