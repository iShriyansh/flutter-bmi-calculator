
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
class BottomButton extends StatelessWidget {

  final String bottomBtnText;
  final Function onTap;
  BottomButton({this.bottomBtnText,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(mainAxisAlignment : MainAxisAlignment.center,
          children: <Widget>[Text(bottomBtnText,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800))],),
        height: kBottomContainerHeights,
        decoration: BoxDecoration(
          color: Color(0xffEA1556),

        ),
      ),
    );
  }
}