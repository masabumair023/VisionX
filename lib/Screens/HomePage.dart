import 'package:finalyearproject/CameraDetection/CameraDetection.dart';
import 'package:flutter/material.dart';
import 'Gallery.dart';
import '../explore/explore.dart';
import 'Profile.dart';


class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    explore(),
    cameradetc(),
    camera1(),
    UserProfile(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: SizedBox(
            height: 190,
            width: 190,
            child: Image.asset('images/logoAppbar.png', fit: BoxFit.cover)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
              backgroundColor: Colors.black87),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
              backgroundColor: Colors.black87),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'Gallery',
              backgroundColor: Colors.black87),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.black87),
        ],
        onTap: _onItemTap,
      ),
    );
  }
}
