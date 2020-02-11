import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Turista/models/categories.dart' as categories;
import 'package:Turista/pages/card_deck_page.dart';
import 'package:Turista/widgets/custom_top_bar.dart';
import 'package:Turista/widgets/dashboard_listitems.dart';
import "package:Turista/models/test_images.dart" as imgs;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
        title: Text("Turista",style: Theme.of(context).textTheme.title,),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.sort,size: 48),
        ),
        trail: IconButton(
          onPressed: (){},
          icon: Icon(Icons.center_focus_weak,size: 48),
        ),
      ),
      body: Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 3),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        DashBoardListItem(
                            title: "Browse By Mood",
                            subTitle: "Categories",
                            child: new Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (){
                                   Navigator.push(context,MaterialPageRoute(builder: (context)=>new CardDeckPage(title: categories.categories[index].title,)));
                                  },
                                  child: Card(
                                    elevation: 6,
                                    color: Theme.of(context).primaryColor,
                                    clipBehavior: Clip.hardEdge,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Image.network(
                                            categories.categories[index].imageUrl,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Color.fromARGB(200, 212, 39, 241),
                                                  Color.fromARGB(30, 0, 0, 0),
                                                ]
                                              )
                                            ),
                                          ),
                                        ),
                                        Align(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,15),
                                            child: Text(categories.categories[index].title,style: TextStyle(fontSize: 20),),
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),

                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: imgs.images.length,
                              itemWidth: 160,
                              itemHeight: 220,
                              layout: SwiperLayout.STACK,
                            )
                        ),
                        DashBoardListItem(
                          title: "Places You\'ve",
                          subTitle: "Been To",
                          child: SizedBox(
                            height: 300,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          color: Theme.of(context).accentColor
        ),
    );
  }
}


