// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:globalidoc/screen/camera.dart';

class SignatureWidget extends StatefulWidget {
  const SignatureWidget ({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _SignatureWidgetState createState() =>_SignatureWidgetState();
}
class _SignatureWidgetState extends State<SignatureWidget>{
  late List<CameraDescription> cameras;
  late CameraController cameraController;
   int direction=1;
   
  @override
  void initState(){
    startCamera(1);
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
              if(!cameraController.value.isInitialized){
                 return;
              }
              if(cameraController.value.isTakingPicture){
                return;
              }
              
              try {
                await cameraController.setFlashMode(FlashMode.off);
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
                return;
              }
            },
            child:
              button2( Icons.check_circle_outline, Alignment.bottomCenter)
            ),
          ),
        ],
      )
     );
    }
   } 
    Widget button2(IconData icon ,Alignment alignment){
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
                Icons.check_circle_outline,
                color:Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }