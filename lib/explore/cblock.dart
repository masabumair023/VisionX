import 'package:finalyearproject/Animations/FadeAnimations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cblock extends StatefulWidget {
  const cblock({Key? key}) : super(key: key);

  @override
  _cblockState createState() => _cblockState();
}

class _cblockState extends State<cblock> {

  String? valueChoose;
  List listItem = ["C1", "C2", "C3", "C4", "C5","Faculty Office","HOD Office","Conference room", ];
  List listItem1 = ["C1.1", "C1.2", "C1.3", "C1.4", "C1.5", "E-Rozgaar Center","CLab 1"];
  List listItem2 = ["C2.1", "C2.2", "C2.3", "C2.4", "C2.5", "Software House","CLab 2","CLab 5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/cblock.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(.3)
                              ]
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 1, bottom: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(1, Text("CS Department", style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)
                              ,)),
                            SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1.6, Text("The department of computer science was established in December 2008, in response to the up-and-coming needs to prepare IT Professionals of tomorrow for software industry. It has fulfilled the long felt need of quality education in computing, especially in the southern core of the Punjab Province. CS Department has launched two successful bachelor programs with the tag Bachelors of Science in Computer Science (BSCS), Bachelors of Science in Software Engineering (BSSE)and Bachelors of Science in Telecommunication and Networking (BSTN). These degree programs mainly focus on advance learning.",
                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                        SizedBox(height: 40,),
                        FadeAnimation(1.6,
                            Text("Floors", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                                                            //Ground Floor
                        Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16,right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: DropdownButton(
                          hint: Text("Ground Floor ", style: TextStyle(color: Colors.white,fontSize: 16,),
                          ),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          value: valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue as String?;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> cblock()));
                              },
                              value: valueItem,
                              child:  Text(valueItem),
                            );
                        }).toList(),
                        ),
                        ),
                  ),

                                                    // 1st Floor
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16,right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButton(
                              hint: Text("1st Floor ", style: TextStyle(color: Colors.white,fontSize: 16,),
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              value: valueChoose,
                              onChanged: (newValue){
                                setState(() {
                                  valueChoose = newValue as String?;
                                });
                              },
                              items: listItem1.map((valueItem){
                                return DropdownMenuItem(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> cblock()));
                                  },
                                  value: valueItem,
                                  child:  Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                                                              //2nd Floor
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16,right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButton(
                              hint: Text("2nd Floor ", style: TextStyle(color: Colors.white,fontSize: 16,),
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              value: valueChoose,
                              onChanged: (newValue){
                                setState(() {
                                  valueChoose = newValue as String?;
                                });
                              },
                              items: listItem2.map((valueItem){
                                return DropdownMenuItem(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> cblock()));
                                  },
                                  value: valueItem,
                                  child:  Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
