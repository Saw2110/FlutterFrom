import 'package:flutter/material.dart';
import 'package:marketing/widget/alert/confirmation_widget.dart';

class ConfirmationAlert {
  static confirmation(
      {required BuildContext context,
      required Function onConfirm,
      required Function onCancel,
      required String text}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ConfirmationAlertWidget(
          text: text,
          context: context,
          onCancel: () {
            onCancel();
          },
          onConfirm: () {
            onConfirm();
          },
        ),
      ),
    );
  }
}
