
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';



class cardData extends StatelessWidget {

  final IconData cardIcons;
  final String cardName;


  const cardData({this.cardIcons,this.cardName}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardIcons,
          size: 85,
          color: Colors.white,),

        SizedBox(height: 10,),

        Text(cardName, style: kLabelText)

      ],

    );
  }
}