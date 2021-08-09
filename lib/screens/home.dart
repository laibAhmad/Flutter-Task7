import 'package:flutter/material.dart';
import 'package:task7/screens/calls.dart';
import 'package:task7/screens/chats.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Calls(),
      Icon(
        Icons.camera,
        size: 100,
        color: Colors.purple,
      ),
      Chats(),
    ];

    void _onTap(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Calls',
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            label: 'Camera',
            icon: Icon(Icons.camera),
          ),
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(Icons.chat),
          ),
        ],
      ),
    );
  }
}
