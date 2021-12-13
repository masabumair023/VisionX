import 'dart:io';
import 'package:finalyearproject/CameraDetection/ablock.dart';
import 'package:finalyearproject/CameraDetection/cblock.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';



class camera1 extends StatefulWidget {
  const camera1({Key? key}) : super(key: key);

  @override
  _camera1State createState() => _camera1State();
}

class _camera1State extends State<camera1> {

  File? pickedImage;
  bool isImageLoaded = false;
  List? _result;
  String _confidence ="";
  String _name= "";
  String numbers = '';

  getImageFromGallery() async{
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;

    });
    applyModelOnImage(pickedImage!);
  }


   loadModel() async{
     await Tflite.loadModel(
       labels: "assets/labels.txt",
       model: "assets/model_unquant.tflite"
     );
   }
  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5
    );

    setState(() {
      _result = res;

      String str = _result![0]['label'];
      _name = str.substring(0);
      _confidence = _result != null ?
      (_result![0]['confidence']*100.0).toString().substring(0,2)  : "";
      print(_result![0]['confidence'].runtimeType);
      print(_result.runtimeType);

      if(_result![0]['confidence']>= 0.7 && _result![0]['label'] == "CS Department")
        {
          Future.delayed(Duration(seconds: 1), (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cpblock()));
          });
        }
      else if(_result![0]['confidence']>= 0.7 && _result![0]['label'] == "A Block")
        {
          Future.delayed(Duration(seconds: 1), (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => apblock()));
          });
        }

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel().then((val){
      setState(() {

      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
        child: Column(
          children: [
            SizedBox(height: 0,),
            isImageLoaded ? Center(
              child: Container(
                height: 550,
                width: 395,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(pickedImage!.path)),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ):Container(),
            Text("$_name ",style: TextStyle(color: Colors.white,fontSize: 20))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: (){
             getImageFromGallery();
            },
            child: Icon(Icons.add,color: Colors.white,),
          )
        ],
      ),
    );
  }
}
