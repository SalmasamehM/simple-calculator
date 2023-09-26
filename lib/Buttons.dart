import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  // const Buttons({super.key});

  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  Buttons(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          //clipper: My,
          child: Container(
            color: Color(0xFF374352),
            child: Center(
              child: Text(buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }
}
