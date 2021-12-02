import 'package:flutter/cupertino.dart';

class BMIModel {
  double bmi;
  bool isNormal;

  String comments;

  BMIModel({required this.bmi, required this.isNormal, required this.comments});
}

class AgeModel {
  late double size;
  late Color color;

  AgeModel({required this.color,required this.size});
}
