import 'package:customstuff/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';

class OrgDetailWidget extends StatelessWidget {
  final String value;

  const OrgDetailWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: ContainerDecoration.decoration(
        bColor: Colors.white,
        color: containerFillColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Text(value),
    );
  }
}
