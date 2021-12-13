import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class cpblock extends StatefulWidget {
  const cpblock({Key? key}) : super(key: key);

  @override
  _cpblockState createState() => _cpblockState();
}

class _cpblockState extends State<cpblock> {
  @override
  Widget build(BuildContext context) {
    return Panorama(
      child: Image.asset("images/StreetView360.jpg"),
    );
  }
}
