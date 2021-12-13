import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:tflite/tflite.dart';
import 'package:finalyearproject/main.dart';
import 'ablock.dart';
import 'cblock.dart';

class cameradetc extends StatefulWidget {
  const cameradetc({Key? key}) : super(key: key);

  @override
  _cameradetcState createState() => _cameradetcState();
}

class _cameradetcState extends State<cameradetc> {
  CameraImage? imgCamera;
  CameraController? cameraController;
  String result= " ";
  bool isWorking = false;

  @override
  void initState(){
    super.initState();
    initCamera();
    loadModel();
  }
  @override
  void dispose() async{
    super.dispose();
    await Tflite.close();
    cameraController!.dispose();
  }
  initCamera(){
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if(!mounted)
      {
        return;
      }
      else
      {
        setState(() {
          cameraController!.startImageStream((imageFromStream) => {
            if(!isWorking)
              {
                isWorking = true,
                imgCamera = imageFromStream,
                runModelOnStreamFrames(),
              }
          });
        });
      }
    });
  }



  runModelOnStreamFrames()async{
    if(imgCamera!=null){
      var recognitions = await Tflite.runModelOnFrame(
          bytesList: imgCamera!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgCamera!.height,
          imageWidth: imgCamera!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.1,
          asynch: true
      );
      result = '';
      // recognitions.forEach((response) {
      //
      //     result += response['label'] + "  " + (response["confidence"]*100.0).toString().substring(0,2)+"%" ;
      //     String aStr = result.replaceAll(new RegExp(r'[^0-9]'),'');
      //     int aInt = int.parse(aStr);
      //     //print(aInt);
      //     print(response['label']);
      //   if(aInt >= 70 && response['label'] == 'CS Department')
      //     {
      //
      //         Navigator.pushReplacement(context, MaterialPageRoute(
      //             builder: (context) => cpblock()));
      //
      //     }
      //   else if (aInt >= 70 && response['label'] == 'A Block')
      //     {
      //       Navigator.pushReplacement(context, MaterialPageRoute(
      //           builder: (context) => apblock()));
      //     }
      // });
      for(final response in recognitions)
        {
              result += response['label'] + "  " + (response["confidence"]*100.0).toString().substring(0,2)+"%" ;
              String aStr = result.replaceAll(new RegExp(r'[^0-9]'),'');
              int aInt = int.parse(aStr);
              //print(aInt);
              print(response['label']);
            if(aInt >= 70 && response['label'] == 'CS Department')
              {
                Future.delayed(Duration(seconds: 2), (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => cpblock()));
                });
                    return;
              }
            else if (aInt >= 70 && response['label'] == 'A Block')
              {
               Future.delayed(Duration(seconds: 2), (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => apblock()));
                });
                return ;
              }
        }
      setState(() {
        result;
      });
      isWorking =false;
    }
  }

  loadModel() async{
    await Tflite.loadModel(
        model: "assets/Old/model_unquant.tflite",
        labels: "assets/Old/labels.txt",
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.height*0.6,
              child: !cameraController!.value.isInitialized?
              Container():
              AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),),
            ),
          ),
          Text(result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
          ),
        ],
      ),
    );
  }
}

