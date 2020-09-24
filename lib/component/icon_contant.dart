import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';

const heightBetween=15.0;
const sizeoficon=80.0;

class carddata extends StatelessWidget {
  carddata({this.icon,this.lable});//constructer
  final IconData icon;             //data declaration
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[         //widget in that specifice cade
          Icon(
            icon,
            size: sizeoficon,
          ),
          SizedBox(
            height: heightBetween,
          ),
          Text(
            lable,
            style: kLabletextstyle
          )
        ]
    );
  }
}
