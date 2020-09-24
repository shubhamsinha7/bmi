import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTittle});
  final Function onTap;
  final String buttonTittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:Center(
          child: Text(
            buttonTittle,
            style: klargeButtonTextStyle,
          ),
        ),
        color: kBottomcontainercolor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomcontainerHeight,
      ),
    );
  }
}
