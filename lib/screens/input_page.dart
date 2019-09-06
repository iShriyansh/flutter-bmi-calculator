import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/icons_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'resultPage.dart';
enum GenderType { Male, Female }
int height = 180;
int weight = 0;
int age = 0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}



class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: reUsableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.Male;
                    });
                  },
                  colorz: selectedGender == GenderType.Male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: cardData(
                    cardIcons: FontAwesomeIcons.mars,
                    cardName: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: reUsableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.Female;
                    });
                  },
                  colorz: selectedGender == GenderType.Female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: cardData(
                    cardIcons: FontAwesomeIcons.venus,
                    cardName: "FEMALE",
                  ),
                ),
              ),
            ],
          )),

            Expanded(
              child: reUsableCard(colorz: kCardColor,cardChild:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Height",
                        style: kLabelText,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic ,
                    children: <Widget>[
                      Text(
                        height.toString(),
                      style: kNumberTextStyle),

                      Text("cm"
                      ,style: kLabelText,),

                    ],
                    ),

                SliderTheme(
                  data:SliderTheme.of(context).copyWith(
                     activeTrackColor: Colors.white,
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30
                    )

                  ),



                  child: Slider(

                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,

                    inactiveColor: Color(0xff8D8E98),




                    onChanged: (double newvalue){

                      setState(() {
                       height = newvalue.toInt();

                      });
                    },

                    ),
                )

                  ],
                ),),


          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reUsableCard(
                      colorz: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                      Text("Weight",

                      style: kLabelText
                      ),
                        
                       Text( weight.toString(),style: kNumberTextStyle,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[


                         RoundButton(
                           iconType: FontAwesomeIcons.minus,
                           onpress: (){
                             setState(() {
                               weight--;
                             });
                           },

                         ),
                         SizedBox(width: 10),
                         RoundButton(iconType: FontAwesomeIcons.plus,

                           onpress: (){setState(() {
                             weight++;
                           });},


                         ),

                       
                       
                       ],



                      )

                      ],
                      
                      
                      
                    )
                  ),


                ),




                Expanded(
                  child: reUsableCard(colorz: kCardColor,cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                     Text("Age",style: kLabelText,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                        RoundButton(iconType : FontAwesomeIcons.minus,
                          onpress: (){
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(width: 10,),
                        RoundButton(
                          iconType: FontAwesomeIcons.plus,
                          onpress: (){
                          setState(() {
                            age++;
                          });
                        },)

                      ],)

                    ],

                  ),),






                )
              ],
            ),
          ),
          new BottomButton(bottomBtnText: "CALCULATE",
          onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(bmi: calc.calculateBmi(),resultText: calc.getResult(),feed: calc.giveFeedback(),)),
            );
          },),
        ],
      ),
    );
  }


}


class RoundButton extends StatelessWidget {

     final  IconData iconType ;
     final Function onpress;
       
    RoundButton({this.iconType,this.onpress});

  
  Widget build(BuildContext context) {
    return RawMaterialButton(

     constraints: BoxConstraints.tightFor(height: 56.0,width: 56.0),
      fillColor: Color(0xff4c4f5e),
      shape: CircleBorder(),
      child: Icon(iconType),
      onPressed: onpress,
      elevation: 0,
    );
  }
}
