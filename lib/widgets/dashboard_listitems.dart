import 'package:flutter/material.dart';

class DashBoardListItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget child;

  DashBoardListItem({this.title, this.subTitle, this.child});

  @override
  _DashBoardListItemState createState() => _DashBoardListItemState();
}

class _DashBoardListItemState extends State<DashBoardListItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.title,textAlign: TextAlign.left,),
                    (widget.subTitle != null) ? Text(widget.subTitle,textAlign: TextAlign.left,style: Theme.of(context).textTheme.body2,) : Container(),
                  ],
                ),
                IconButton(icon: Icon(Icons.more_vert, size: 30,),onPressed: (){},),
              ],
            ),
            (widget.child != null) ? Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,0),
                child: widget.child
            ) : Container()
          ],
        ),
      ),
    );
  }
}
