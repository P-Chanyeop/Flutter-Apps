import 'package:flutter/material.dart';

class NoneImageButton extends StatelessWidget {
  NoneImageButton({required this.text, required this.color, required this.onPressed});

  final Widget text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        height: 50.0,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              text,
              Opacity(
                opacity: 0.0,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(backgroundColor: color),
        ),
    );
  }
}
