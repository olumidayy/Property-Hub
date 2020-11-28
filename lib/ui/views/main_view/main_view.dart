import 'package:flutter/material.dart';
import 'package:property_hub/ui/views/explore_view/explore_view.dart';

class MainView extends StatefulWidget {
  
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _index = 0;

  void _switchIndex(int index){
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExploreView(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: _index,
        onTap: _switchIndex,
        selectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'Profile')
        ],
      ),
    );
  }
}