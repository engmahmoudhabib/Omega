import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:omega/core/statics/colors.dart';

import '../widgets/home_content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


var _bottomNavIndex = 0;

final iconList = <IconData>[
    Icons.person_outline,
    Icons.notifications_outlined,
    Icons.calendar_month_outlined,
    Icons.settings_outlined,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElasticDrawer(
      mainColor: MyAppColors.iconColor,
      drawerColor:MyAppColors.iconColor,
      markPosition: 0.5,
      mainChild: Scaffold(
      body: CourseCard(
        
      ), 
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.home),
        backgroundColor: MyAppColors.iconColor,
        onPressed: () {},
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    ),
      drawerChild: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffE6E6E6),
                MyAppColors.iconColor,
              ],
            ),
          ),
        child: Center(child: Text('Main')),));
  }
}
