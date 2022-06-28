import 'package:flutter/material.dart';

class CustomElevetedButon extends StatelessWidget {
  CustomElevetedButon(
      {required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.callback,
      this.butonicon,
      required this.height,
      this.radius,
      required this.width,
      this.topbottomPadding,
      this.leftRightPadding}) {
    raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: buttonColor,
      primary: buttonColor,
      minimumSize: Size(88, 25),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
  final double width;
  final String buttonText;
  double? radius;
  final double height;
  Widget? butonicon;
  final VoidCallback callback;
  final Color buttonColor;
  final Color textColor;
  double? topbottomPadding;
  double? leftRightPadding;
  late ButtonStyle raisedButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftRightPadding ?? 0,
          right: leftRightPadding ?? 0,
          top: topbottomPadding ?? 0,
          bottom: topbottomPadding ?? 0),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: callback,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              butonicon ?? SizedBox(),
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor),
              ),
              SizedBox()
            ],
          ),
          style: raisedButtonStyle,
        ),
      ),
    );
  }
}
