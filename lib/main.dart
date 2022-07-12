import 'package:flutter/material.dart';
import 'package:marketing/service/routehelper/route_name.dart';
import 'package:marketing/state/orglist_state.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';
import 'service/routehelper/route_helper.dart';
import 'state/index_state.dart';
import 'state/login_state.dart';
import 'state/splash_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashState()),
        ChangeNotifierProvider(create: (_) => LoginState()),
        ChangeNotifierProvider(create: (_) => IndexState()),
        ChangeNotifierProvider(create: (_) => OrgListState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Easy Office",
        theme: ThemeData(
            primarySwatch: primarySwatch,
            primaryColor: primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
              ),
            )),
        initialRoute: splashPath,
        onGenerateRoute: RouteGenerator.generateRoute,
        // home:  const IndexScreen(),
      ),
    );
  }
}
