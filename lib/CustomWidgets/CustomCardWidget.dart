import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  CustomCardWidget({@required this.customColor, this.cardIcon, this.onPress});
  final Color customColor;
  final Widget cardIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardIcon,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: customColor, borderRadius: BorderRadius.circular(10.0)),
        ));
  }
}
