import 'package:flutter/material.dart';

class CustomTopBar extends StatefulWidget implements PreferredSizeWidget{
  final Widget title;
  final Widget leading;
  final Widget trail;
  final EdgeInsets padding;
  CustomTopBar({this.title, this.leading, this.trail,this.padding});

  @override
  _CustomTopBarState createState() => _CustomTopBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: widget.padding,
        color: Theme.of(context).accentColor,
        child: Stack(
          children: <Widget>[
              Align(child: widget.title,),
              Align(
                alignment: Alignment(-1,-1),
                child: (widget.leading != null) ? widget.leading : Container(),
              ),
              Align(
                alignment: Alignment(1,-1),
                child: (widget.trail != null) ? widget.trail : Container(),
              )
//              SizedBox(
//                  width: double.infinity,
//                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      (widget.trail != null) ? widget.leading : Container(),
//                      (widget.trail != null) ? widget.trail : Container()
//                    ],
//                  )),

//            Center(child: widget.title,),
//            Positioned(
//              left: 0,
//              top: 1,
//              child: SizedBox(
//                height: 54,
//                width: 54,
//                child: Center(child: widget.leading),
//              )
//            ),
//            Positioned(
//              right: 0,
//              top: 5,
//              child: SizedBox(
//                height: 54,
//                width: 54,
//                child: Center(child: widget.trail),
//              )
//            ),
          ],
        ),
      ),
    );
  }
}
