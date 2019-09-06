import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/screens/input_page.dart';



class ResultPage extends StatelessWidget {
  String bmi;
  String resultText;
  String feed;
  ResultPage({this.bmi,this.resultText,this.feed});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
          Expanded(

              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                    "Your Result",
                    style: kTitleTextStyle),
              )
          ),
             Expanded(
               flex: 5,
               child: reUsableCard(colorz: kActiveCardColor,cardChild:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   
                   children: <Widget>[
                     Text(resultText,style: kNormalTextStyle,),

                    Text(bmi,style: kBmiTextStyle),

                     Text(feed,
                       textAlign: TextAlign.center,
                       style: kBodyTextStyle,),



                   ],
                   



                 ),),


             ),
    Expanded(
    child: BottomButton(
    bottomBtnText: "RE-CALCULATE",
    onTap: (){
    Navigator.pop(context);
    },
    )
    )



    ]
    ));
  }
}


