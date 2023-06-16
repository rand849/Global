// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:globalidoc/screen/PreviewPage.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    startCamera(widget.cameras![0]);
    super.initState();
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(picture: picture),
        ),
      );
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future startCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
    );
    try {
      await _cameraController.initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint('camera error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: double.infinity, child: CameraPreview(_cameraController)),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: RawMaterialButton(
              onPressed: takePicture,
              child: button(Icons.camera_alt_outlined, Alignment.bottomCenter)),
        ),
        GestureDetector(
            onTap: () {
              setState(() => _isRearCameraSelected = !_isRearCameraSelected);
              startCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
            },
            child:
                button3(Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
      ],
    ));
  }
}

Widget button(IconData icon, Alignment alignment) {
  return Align(
      alignment: alignment,
      child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            bottom: 20,
          ),
          width: 75,
          height: 75,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                )
              ]),
          child: const Center(
            child: Icon(
              Icons.camera_alt_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )));
}

Widget button3(IconData icon, Alignment alignment) {
  return Align(
      alignment: alignment,
      child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            bottom: 20,
          ),
          width: 75,
          height: 75,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                )
              ]),
          child: const Center(
            child: Icon(
              Icons.flip_camera_ios_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )));
}
