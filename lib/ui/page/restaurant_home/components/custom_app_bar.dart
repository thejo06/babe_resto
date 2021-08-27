import 'package:babe_resto/common/styles.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      elevation: 0,
      flexibleSpace: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/header_background.jpg'),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20.0, height: 100.0),
            BorderedText(
              strokeCap: StrokeCap.round,
              strokeColor: whiteColor,
              child: Text(
                'Babe Resto',
                style: headingText.copyWith(color: redColor),
              ),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: headingText2.copyWith(color: redColor),
              child: AnimatedTextKit(animatedTexts: [
                RotateAnimatedText('Restoran'),
                RotateAnimatedText('Makanan'),
                RotateAnimatedText('Minuman'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
