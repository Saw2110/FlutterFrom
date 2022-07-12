import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';

class ConfirmationAlertWidget extends StatelessWidget {
  final BuildContext context;
  final Function onConfirm;
  final Function onCancel;
  final String text;

  const ConfirmationAlertWidget({
    Key? key,
    required this.text,
    required this.context,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Confirmation",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: () {
                              onCancel();
                            },
                            icon: const Icon(Icons.close, color: Colors.white)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text(
                    "Are you sure, \n$text",
                    style: kTextFormTitle.copyWith(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red.shade400),
                          ),
                          child: const Text("CANCEL"),
                          onPressed: () {
                            onCancel();
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text("CONFIRM"),
                          onPressed: () {
                            onConfirm();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
