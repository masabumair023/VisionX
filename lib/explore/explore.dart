import 'package:finalyearproject/explore/ablock.dart';
import 'package:finalyearproject/explore/cblock.dart';
import 'package:flutter/material.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  _exploreState createState() => _exploreState();
}

class _exploreState extends State<explore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      //child: myDetailsContainer(),
                    ),
                    Container(
                      width: 525,
                      height: 260,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(24.0),
                        child: Image.asset(
                          "images/ablock.png",
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: RaisedButton(
              color: Colors.blueGrey,
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
              onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>ablock()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text(
                  "A Block",
                style: TextStyle(color:Colors.white,fontSize: 20,
                  fontWeight: FontWeight.normal,),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 525,
                          height: 260,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image.asset(
                              "images/cblock.png",
                              fit: BoxFit.fill,
                              alignment: Alignment.topRight,
                            ),
                          ),),
                      ]
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>cblock()));
              },
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text(
                  "CS Department",
                  style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.normal,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

