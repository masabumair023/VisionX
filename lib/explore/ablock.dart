import 'package:finalyearproject/Animations/FadeAnimations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ablock extends StatefulWidget {
  const ablock({Key? key}) : super(key: key);

  @override
  _ablockState createState() => _ablockState();
}

class _ablockState extends State<ablock> {

  String? valueChoose;
  List listItem = ["Item1","Item2","Item3"];
  List listItem1 = ["Item4","Item5","Item6"];
  List listItem2 = ["Item7","Item8","Item9"];
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
                            image: AssetImage('images/ablock.png'),
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

                            FadeAnimation(1, Text("A block", style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)
                              ,)),
                            SizedBox(height: 20,),
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
                        FadeAnimation(1.6, Text("The infrastructure of the department is pivotal to its vision of multi-disciplinary education and research. It comprises state of the art and well equipped teaching and research laboratories, lecture halls and faculty offices. A degree in Mechanical Engineering gives knowledge and skills to be involved in the design, development and manufacturing of products, machines and mechanical engineering systems, including engines and turbines, land transport vehicles, ships, aircrafts, building services (air conditioning, pumps, fans), refrigeration systems, manufacturing processes and industrial plants.",
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ablock()));
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
                              elevation: 16,
                              isExpanded: true,
                              underline: Container(),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ablock()));
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ablock()));
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
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
