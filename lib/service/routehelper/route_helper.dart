import 'package:customstuff/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/assets_list.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/screen/index/index_screen.dart';
import 'package:marketing/screen/login/login_screen.dart';
import 'package:marketing/screen/orglist/orgdetail_screen.dart';
import 'package:marketing/screen/orglist/orglist_screen.dart';
import 'package:marketing/screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'route_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const SplashScreen(),
        );

      case loginPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const LoginScreen(),
        );

      case indexPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const IndexScreen(),
        );

      case orgListPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const OrgListScreen(),
        );

      case orgDetailPath:
        var value = settings.arguments as String;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: OrgDetailScreen(organizationName: value),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return PageTransition(
      type: PageTransitionType.rightToLeft,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('On Process'),
          elevation: 0,
        ),
        body: Container(
          color: primaryColor,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: ContainerDecoration.decoration(
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(AssetsList.lockImage, height: 150.0),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Sorry for inconvenience.",
                      style: kTitleText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      "Account does not have permission.",
                      style: kTitleText.copyWith(
                          color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                  const SizedBox(height: 50.0)
                ]),
          ),
        ),
      ),
    );
  }
}
