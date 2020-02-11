import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Turista/models/categories.dart' as categories;

class SwipeCard extends StatelessWidget {
  final int index;
  SwipeCard(this.index);
  @override
  Widget build(BuildContext context) {
    //return Container(color: Colors.red,);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).accentColor,
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
      )
    );
  }
}
