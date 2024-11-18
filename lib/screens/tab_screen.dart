import 'package:eod_reconcilaton/screens/total_profit/total_profit.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

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
    {'page': const TotalProfit(), 'title': 'PROFITS'},
  ];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      // drawer: const MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        // backgroundColor: Theme.of(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
