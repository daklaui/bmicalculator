import 'package:bmicalculator/CustomWidgets/BottomButton.dart';
import 'package:bmicalculator/CustomWidgets/CustomCardWidget.dart';
import 'package:bmicalculator/Global/constant.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.tips,
      @required this.nameUser});

  final String nameUser;
  final String bmiResult;
  final String resultText;
  final String tips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                ('Welcom ' + nameUser + ' Your Result').toUpperCase(),
                style: kTitlestyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: CustomCardWidget(
                customColor: kCurrentColor,
                cardIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiText,
                    ),
                    Text(
                      tips.toUpperCase(),
                      style: kBodytext,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomButton(
              onTap: () => Navigator.pop(context), title: 'RECALCULATE')
        ],
      ),
    );
  }
}
