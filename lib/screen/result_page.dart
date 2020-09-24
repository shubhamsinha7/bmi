import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';
import '../component/reusanle_card.dart';
import 'package:bmi/component/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculater',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleTextStyle,),
            ),
          ),
          Expanded(
           flex: 5,
           child: reusableCard(colour: kActivecardcolor,
             CardChild: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children:<Widget>[
                 Text(
                   resultText.toUpperCase(),
                   style: kResultTextStyle,
                 ),
                 Text(
                   bmiResult,
                   style: kBMITextStyle,
                 ),
                 Text(
                   interpretation,
                   style: kBodyTextStyle,
                   textAlign: TextAlign.center,
                 )
               ],
             ),
           ),
          ),
          BottomButton(
            buttonTittle: 'Re-Calculate',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      )
    );
  }
}
