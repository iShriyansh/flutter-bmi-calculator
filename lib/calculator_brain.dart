import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final int height;

  final int weight;

  double _bmi;

  String calculateBmi(){
    _bmi  = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi>=25){
      return "Overweight";
    }
    else if (_bmi > 18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }

  }

  String giveFeedback(){

    if(_bmi>=25){
      return "You should eat less";
    }
    else if (_bmi > 18.5){
      return "yay your bmi is normal";
    }
    else{
      return "you should eat more";
    }

  }





}