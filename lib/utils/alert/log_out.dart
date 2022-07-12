import 'package:flutter/material.dart';
import 'package:marketing/widget/alert/logout_widget.dart';

class LogOut {
  static logOut({required BuildContext context}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: LogoutAlertWidget(context: context),
      ),
    );
  }
}
