import 'package:bmicalculator/CustomWidgets/BottomButton.dart';
import 'package:bmicalculator/CustomWidgets/CustomCardWidget.dart';
import 'package:bmicalculator/CustomWidgets/RoundButton.dart';
import 'package:bmicalculator/CustomWidgets/iconContent.dart';
import 'package:bmicalculator/Global/constant.dart';
import 'package:bmicalculator/LogicCode/Calculator.dart';
import 'package:bmicalculator/screens/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = inactiveCardColor;
  Color femalCardColor = inactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 20;
  TextEditingController userName = TextEditingController();
  void updateColor(Gender selectedGender) {
    switch (selectedGender) {
      case Gender.male:
        maleSelectFunction();

        break;
      case Gender.female:
        femaleSelectFunction();

        break;
      default:
        break;
    }
  }

  void femaleSelectFunction() {
    if (femalCardColor == inactiveCardColor) {
      femalCardColor = activeCardColor;
      maleCardColor = inactiveCardColor;
    } else {
      femalCardColor = inactiveCardColor;
    }
  }

  void maleSelectFunction() {
    if (maleCardColor == inactiveCardColor) {
      maleCardColor = activeCardColor;
      femalCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 0,
                child: Container(
                  color: kCurrentColor,
                  height: 60,
                  child: TextFormField(
                    controller: userName,
                    decoration: InputDecoration(labelText: 'Enter your name'),
                  ),
                )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: CustomCardWidget(
                  onPress: () {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  customColor: maleCardColor,
                  cardIcon: iconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                    child: CustomCardWidget(
                  onPress: () {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  },
                  customColor: femalCardColor,
                  cardIcon: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            )),
            Expanded(
                child: CustomCardWidget(
              customColor: kCurrentColor,
              cardIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabeltextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text('cm', style: kLabeltextStyle)
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.white,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ))
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: CustomCardWidget(
                  customColor: Color(0xFF1D1E33),
                  cardIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT'),
                        Text(weight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ]),
                )),
                Expanded(
                    child: CustomCardWidget(
                        customColor: Color(0xFF1D1E33),
                        cardIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE'),
                              Text(
                                age.toString(),
                                style: kNumberStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ]))),
              ],
            )),
            BottomButton(
                title: 'CALCULATE',
                onTap: () {
                  {
                    Calculator calculate =
                        Calculator(height: height, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  nameUser: userName.text,
                                  bmiResult: calculate.calculeBmi(),
                                  resultText: calculate.getResult(),
                                  tips: calculate.getTips(),
                                )));
                  }
                }),
          ],
        ));
  }
}
