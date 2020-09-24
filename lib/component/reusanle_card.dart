import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  reusableCard({@required this.colour,this.CardChild,this.onPress});
  final Color colour;
  final Widget CardChild;   //custemize widget
  final Function onPress;   //function as the first order
  @override
  Widget build(BuildContext context) {
    return GestureDetector(   //we build reusable card to also detected gesture
      onTap: onPress,         //by creatiog function as a first order
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
