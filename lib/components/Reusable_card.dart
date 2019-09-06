import 'package:flutter/material.dart';

class reUsableCard extends StatelessWidget {

  final  Color colorz;
  final Widget cardChild;
  final Function onPress;

  const reUsableCard({this.colorz,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorz,
        ),
      ),
    );
  }
}


