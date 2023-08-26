import 'package:flutter/material.dart';
import 'package:stock_trading/shared/colors.dart';
import 'package:stock_trading/widgets/portfolio/portfolio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    PortfolioSection(),
    PortfolioSection()
    // MarketsSection(),
    // SearchSection(),
    // NewsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldBackground,
        body: tabs.elementAt(_selectedIndex),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: BottomNavigationBar(
              iconSize: 24,
              currentIndex: _selectedIndex,
              items: _bottomNavigationBarItemItems(),
              onTap: _onItemTapped,
            ),
          ),
        ));
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItemItems() {
    return [
      const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.broken_image),
      ),
      const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.search),
      ),
      const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.newspaper),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
