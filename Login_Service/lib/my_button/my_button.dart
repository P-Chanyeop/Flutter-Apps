import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  MyButton({required this.image, required this.text, required this.color, required this.onPressed});

  final Color color;
  final Widget image;
  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  ButtonTheme(
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image,
            SizedBox(
              width: 50,
            ),
            text,
            Opacity(
              opacity: 0.0,
              child: image,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(backgroundColor: color),
      ),
    );
  }
}