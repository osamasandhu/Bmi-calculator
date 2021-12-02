import 'package:bmi/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bmi_model.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _weightOfUser = 40;
  double _heightOfUser = 100;
  double _bmi = 0;
  int _selectedIndex = -1;

  late Color color = Colors.black;
  late double size = 20;
  BMIModel? _bmiModel;
  late AgeModel ageModel;
  var age = 1;
  var height = 100;
  late double result;
  bool calculateBMI = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: calculateBMI ? purpleColor : lightGreenColor,
        elevation: 0,
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.pacifico(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
        Container(
                height: 150,
                child: calculateBMI
                    ? Container(
                  height: 100,
                  color: purpleColor,
                )
                    : Center(
                  child: RichText(
                      text: TextSpan(
                          text: _bmiModel!.bmi.roundToDouble().toString(),
                          style: GoogleFonts.pacifico(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                              text: _bmiModel!.isNormal
                                  ? "      /   Normal BMI."
                                  : "      /   Not Normal BMI.",
                              style: GoogleFonts.pacifico(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ])),
                ),
                color: calculateBMI ? purpleColor : lightGreenColor,
              ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are You a",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.pacifico(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildContainer(
                            onTap: () => setState(() => _selectedIndex = 0),
                            text: "Male",
                            index: 0,
                            iconData: Icons.male),
                        _buildContainer(
                            onTap: () => setState(() => _selectedIndex = 1),
                            text: "Female",
                            index: 1,
                            iconData: Icons.female),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How  old are you?",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.pacifico(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: 100,
                          separatorBuilder: (BuildContext c, i) {
                            return SizedBox(
                              width: 30,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              child: Text(
                                "${i + 1}",
                                style: GoogleFonts.pacifico(
                                    fontSize: age == i + 1 ? size : 20,
                                    color: age == i + 1
                                        ? color
                                        : Colors.black),
                              ),
                              onTap: () {
                                setState(() {
                                  age = i + 1;
                                  color = purpleColor;
                                  size = 30;
                                });
                              },
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Height",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.pacifico(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${_heightOfUser.toString()} cm",
                          textAlign: TextAlign.start,
                          style:GoogleFonts.pacifico(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 110,
                      decoration:
                      BoxDecoration(border: Border.all(width: 1)),
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          itemCount: 500,
                          separatorBuilder: (BuildContext c, i) {
                            return SizedBox(width: 10);
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Tooltip(
                              message: '${i + 100}',
                              child: Column(
                                children: [
                                  Text(
                                    i % 5 == 0 ? "${i + 100}" : "",
                                    style: GoogleFonts.pacifico(fontSize: 8),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: i % 5 == 0 ? 10 : 33),
                                        width: 7,
                                        color: _heightOfUser == i + 100
                                            ? purpleColor
                                            : Colors.grey,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _heightOfUser = i + 100;
                                          color = purpleColor;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Weight?",
                      textAlign: TextAlign.start,
                      style:GoogleFonts.pacifico(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 16),
                            child: Slider(
                              min: 30.0,
                              max: 120.0,
                              onChanged: (height) {
                                setState(() {
                                  _weightOfUser = height;
                                });
                              },
                              value: _weightOfUser,
                              divisions: 100,
                              activeColor: purpleColor,
                              label: "${_weightOfUser.toStringAsFixed(2)}",
                            ),
                          ),
                        ),
                        Text(
                          "$_weightOfUser kg",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.pacifico(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ))),
        btn(),
        SizedBox(
          height: 10,
        )
        ],
      ),
    ),);
  }

  Widget _buildContainer({required VoidCallback onTap,
    required IconData iconData,
    required String text,
    required int index}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? purpleColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: _selectedIndex == index ? purpleColor : Colors.black,
              width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: _selectedIndex == index ? Colors.white : Colors.black,
            ),
            Text(
              text,
              style: GoogleFonts.pacifico(
                  color: _selectedIndex == index ? Colors.white : Colors.black),
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }

  Widget btn() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: TextButton(
              onPressed: () {
                calculateBMI
                    ? setState(() {
                  _bmi = _weightOfUser /
                      ((_heightOfUser / 100) * (_heightOfUser / 100));

                  if (_bmi >= 18.5 && _bmi <= 25) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: true,
                        comments: "You are Totally Fit");
                  } else if (_bmi < 18.5) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Underweighted");
                  } else if (_bmi > 25 && _bmi <= 30) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Overweighted");
                  } else if (_bmi > 30) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Obsessed");
                  }
                })
                    : setState(() {
                  _weightOfUser = 40;
                  _heightOfUser = 100;
                  _bmi = 0;
                  _selectedIndex = -1;

                  color = Colors.black;
                  size = 20;
                  age = 1;
                  height = 100;
                });

                setState(() {
                  calculateBMI = !calculateBMI;
                });
              },
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: calculateBMI ? lightGreenColor : greenColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(calculateBMI ? "Calculate BMI" : "Reset",style: GoogleFonts.pacifico(),
                    textAlign: TextAlign.center,)),
            )));
  }
}
