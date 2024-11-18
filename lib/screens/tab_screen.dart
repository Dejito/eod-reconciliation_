import 'package:eod_reconcilaton/screens/history/history.dart';
import 'package:eod_reconcilaton/screens/total_profit/profit_homepage.dart';
import 'package:flutter/material.dart';

import 'dashboard/dashboard.dart';

class TabScreen extends StatefulWidget {

  static const id = 'tab_screen';

  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var selectedPageIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {'page': const Dashboard(), 'title': 'HOME'},
    {'page': const ProfitHomepage(), 'title': 'PROFITS'},
    {'page': const History(), 'title': 'HISTORY'},

  ];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[selectedPageIndex]['title']),
      // ),
      // drawer: const MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        // backgroundColor: Theme.of(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "PROFIT",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "HISTORY",
          ),
        ],
      ),
    );
  }
}
