import 'package:customstuff/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/service/routehelper/route_name.dart';

class LogoutAlertWidget extends StatelessWidget {
  final BuildContext context;

  const LogoutAlertWidget({Key? key, required this.context}) : super(key: key);

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
                          "Logout",
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
                              Navigator.pop(context);
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
                    "Are you sure, \nYou want to Logout app?",
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
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text("CONFIRM"),
                          onPressed: () {
                            onSuccess(context);
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

  onSuccess(context) async {
    await SharedPref.removeAllData();
    Navigator.pushNamedAndRemoveUntil(
        context, splashPath, (Route<dynamic> route) => false);
  }
}
