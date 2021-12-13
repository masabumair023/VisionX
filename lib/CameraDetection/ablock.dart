import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class apblock extends StatefulWidget {
  const apblock({Key? key}) : super(key: key);

  @override
  _apblockState createState() => _apblockState();
}

class _apblockState extends State<apblock> {
  @override
  Widget build(BuildContext context) {
    return Panorama(
      child: Image.asset("images/ablock360.jpeg"),
    );
  }
}
