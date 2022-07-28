import 'package:flutter/material.dart';

class DropDownMenuText extends StatelessWidget {
  final String item;

  const DropDownMenuText({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 13.0),
    );
  }
}
