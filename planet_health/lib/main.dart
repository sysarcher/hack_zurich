import 'dart:io';
import 'package:planet_health/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigation_home_screen.dart';
//import 'fitness_app/fitness_app_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:planet_health/globals.dart' as globals;
import 'dart:convert' as convert;

Future<void> fetchApi() async {
  var response = await http.get(
      Uri.parse(globals.base_url + globals.profile_url),
      headers: globals.headers);

  if (response.statusCode == 200) {
    Map<String, dynamic> user = convert.jsonDecode(response.body);
    print('Message: ${user}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void testfetch() {
  const fiveSec = Duration(seconds: 5);
  Timer.periodic(
      fiveSec,
      (Timer t) => fetchApi().then((value) => print("No Error"), onError: (e) {
            print("Error: in HTTP invocation: ${e}");
          }));
}

void main() async {
  testfetch();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Planet Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: NavigationHomeScreen(),
      //home: FitnessAppHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
