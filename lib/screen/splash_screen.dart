import 'package:customstuff/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:marketing/constant/assets_list.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/state/splash_state.dart';
import 'package:marketing/widget/about_elite.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashState>(context, listen: false).getContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashState>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: primaryColor,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor.withOpacity(0.5), Colors.white],
            )),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration:
                        ContainerDecoration.decoration(color: Colors.white),
                    child: Image.asset(AssetsList.appIcon, height: 140.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      state.splashText,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const AboutEasySoft(),
        );
      },
    );
  }
}
