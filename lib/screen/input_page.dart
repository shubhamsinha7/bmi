import 'package:bmi/component/icon_contant.dart';
import 'package:bmi/component/reusanle_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import '../component/bottom_button.dart';
import '../component/roundicon_button.dart';
import 'package:bmi/calculater_brain.dart';


enum Gender{
 male,
 female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height=180;
  int weight=50;
  int age=20;
  /*
  Color malecardcolor=inactivecardcolor;
  Color femalecardcolor=inactivecardcolor;
  void updatecolor(Gender selectedgender)
  {
    if(selectedgender==Gender.male){
      if(malecardcolor==inactivecardcolor){
        malecardcolor=activecardcolor;
        femalecardcolor=inactivecardcolor;
      }
      else{
        malecardcolor=inactivecardcolor;
      }
    }
    if(selectedgender==Gender.female){
      if(femalecardcolor==inactivecardcolor){
        femalecardcolor=activecardcolor;
        malecardcolor=inactivecardcolor;
      }
      else{
        femalecardcolor=inactivecardcolor;
      }
    }
  }
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'BMI Calculater'
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(child: Row(
            children:<Widget>[
              Expanded(
                child: reusableCard(
                  onPress: (){            //function as first order object
                    setState(() {
                      selectedgender=Gender.male;
                    });
                  },
                  colour: selectedgender==Gender.male?kActivecardcolor:kInactivecardcolor,
                  CardChild:carddata(             //custimize widget
                  icon: FontAwesomeIcons.mars,
                  lable: 'Male',
                ),
              ),
                  ),
              Expanded(child: reusableCard(
                onPress: (){                //function as first order object
                  setState(() {
                    selectedgender=Gender.female;
                  });
                },
                colour: selectedgender==Gender.female?kActivecardcolor:kInactivecardcolor,
                CardChild: carddata(
                  icon: FontAwesomeIcons.venus,
                  lable: 'Female',
                ),
              ),),
            ],
          ),
          ),
          Expanded(child: reusableCard(colour: kActivecardcolor,
            CardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Height',
                  style: kLabletextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:<Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle
                    ),
                    Text(
                      'cm',
                      style: kLabletextstyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue){
                      setState(() {
                        height=newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children:<Widget>[
              Expanded(child: reusableCard(colour: kActivecardcolor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Weight',
                      style: kLabletextstyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: reusableCard(colour: kActivecardcolor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      'Age',
                      style: kLabletextstyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                                age--;
                              });}
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                              age++;
                            });
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
            ],
          ),
          ),
          BottomButton(
            buttonTittle: 'Calculate',
            onTap: (){
              CalculaterBrain cal=CalculaterBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmiResult: cal.calculateBMI(),
                resultText: cal.getResult(),
                interpretation: cal.getinterpreter(),
              ),),);
            },
          )
    ],
    ),
    );
  }
}




