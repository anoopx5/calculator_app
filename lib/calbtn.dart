import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final color;
  final colorText;
  final String textButton;
  final tapedbuttn;
  CalcButton({this.color, this.colorText, required this.textButton,this.tapedbuttn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapedbuttn,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  textButton,
                  style: GoogleFonts.rubik(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )),
      ),
    );
  }
}
