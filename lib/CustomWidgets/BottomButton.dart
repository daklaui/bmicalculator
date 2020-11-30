import 'package:flutter/material.dart';

const kLargeButtonText = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const kBottomColor = Color(0xFFEB1555);
const kBottomContainerHeight = 80.0;

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: kLargeButtonText,
        )),
        color: kBottomColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
