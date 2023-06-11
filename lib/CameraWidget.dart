// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:globalidoc/screen/camera.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget ({Key? key}) : super(key: key);
  
  @override
  State<CameraWidget> createState() =>_CameraWidgetState();
}
class _CameraWidgetState extends State<CameraWidget>{
  late List<CameraDescription> cameras;
  late CameraController cameraController;
   int direction=0;

  @override
  void initState(){
    startCamera(0);
    super.initState();
  }
  void startCamera(int direction) async{
    cameras=await availableCameras();

    cameraController=CameraController(
      cameras[direction],
      ResolutionPreset.max,
      enableAudio: false,
      );
    cameraController.initialize().then((value){
      if(!mounted){
        return;
      }
     setState((){}); 
    }
    ).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case'CameraAccessDenied':
          print("Access was denied");
          break;
          default:
          print(e.description);
          break;
        }
      }
    });
  }

  @override
  
  void dispose(){
    cameraController.dispose();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
     return Scaffold(
      body:Stack(
        children: [
          Container(
            height:double.infinity,
            child:CameraPreview(cameraController)
          ),
          Align(
            alignment:AlignmentDirectional.bottomCenter,
            child: RawMaterialButton(onPressed: () async{
              if(cameraController.value.isInitialized){
                 return;
              }
              if(cameraController.value.isTakingPicture){
                return;
              }
              
              try {
                await cameraController.setFlashMode(FlashMode.auto);
                XFile file = await cameraController.takePicture();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context)=>ImagePreview(file))
                   );
              } 
              on CameraException catch (e) {
                debugPrint("Error occured while taking picture:$e");
                return ;
              }
            },
            child:
              button( Icons.camera_alt_outlined, Alignment.bottomCenter)
            ),
          ),
           GestureDetector(
            onTap:(){
              setState(() {
                direction = direction == 0 ? 1: 0;
                startCamera(direction);
              });

            },
            child:
              button3( Icons.flip_camera_ios_outlined, Alignment.bottomLeft)
            ),
        ],
      )
     );
    }
   } 
    Widget button(IconData icon ,Alignment alignment){
      return  Align(
            alignment: alignment,
            child:Container(
              margin: const EdgeInsets.only(
                left:20,bottom: 20,
              ),
              width:75,
              height:75,
              decoration: const BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ]
              ),
              child: const Center(
                child: Icon(
                Icons.camera_alt_outlined,
                color:Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }
       Widget button3(IconData icon ,Alignment alignment){
      return  Align(
            alignment: alignment,
            child:Container(
              margin: const EdgeInsets.only(
                left:20,bottom: 20,
              ),
              width:75,
              height:75,
              decoration: const BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ]
              ),
              child: const Center(
                child: Icon(
                Icons.flip_camera_ios_outlined,
                color:Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }
