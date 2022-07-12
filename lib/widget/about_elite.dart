import 'package:customstuff/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';

class AboutEasySoft extends StatelessWidget {
  const AboutEasySoft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: ContainerDecoration.decoration(bColor: Colors.white),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Product from ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Elite',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const TextSpan(
                    text: ' InfoTech',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
