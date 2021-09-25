import 'package:planet_health/fitness_app/models/tabIcon_data.dart';
import 'package:planet_health/fitness_app/my_covid/my_covid_screen.dart';
import 'package:planet_health/fitness_app/training/training_screen.dart';
import 'package:planet_health/fitness_app/my_co2/my_co2_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fitness_app_theme.dart';
import 'my_diary/my_diary_screen.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:planet_health/globals.dart' as globals;

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget setupAlertDialogContainer() {
    double _fontsz = 20;

    return Container(
      height: 400.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      //color: Colors.blue.shade50,
      //padding: EdgeInsets.all(10.0),
      //margin: EdgeInsets.all(15.0),
      //decoration: BoxDecoration(
      //  borderRadius: BorderRadius.only(
      //    topRight: Radius.circular(500),
      //  ),
      //),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Doctor visit',
                style: TextStyle(fontSize: _fontsz, color: Colors.white),
              ),
              Icon(Icons.local_hospital,
                  color: Colors.white, size: _fontsz + 10),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Personal trainer',
                style: TextStyle(fontSize: _fontsz, color: Colors.white),
              ),
              Icon(Icons.fitness_center,
                  color: Colors.white, size: _fontsz + 10),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'COVID-19',
                style: TextStyle(fontSize: _fontsz, color: Colors.white),
              ),
              Icon(Icons.coronavirus, color: Colors.white, size: _fontsz + 10),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Emergency',
                style: TextStyle(fontSize: _fontsz, color: Colors.white),
              ),
              Icon(Icons.phone, color: Colors.white, size: _fontsz + 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            print('Call Doctor');
            print('Call AR');

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    title: new Text(''),
                    content: setupAlertDialogContainer(),
                  );
                });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyCo2Screen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyCovidScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
