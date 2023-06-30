// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:globalidoc/FinalWidget.dart';
import 'package:globalidoc/PayWidget.dart';
import 'package:globalidoc/WelcomeWidget.dart';
import 'package:globalidoc/screen/PreviewPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  final pages = [
    const FinalWidget(),
    const PayWidget(),
    const WelcomeWidget(),
  ];

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

  Future flipCamera() async {
    setState(() => _isRearCameraSelected = !_isRearCameraSelected);
    startCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
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
    // ignore: no_leading_underscores_for_local_identifiers
    _curvedBarButton(index) {
      setState(() {
        switch (index) {
          case 0:
            takePicture();
            break;
          case 1:
            flipCamera();
            break;
        }
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width:double.infinity,
              child: CameraPreview(_cameraController)),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            _curvedBarButton(index);
          },
          height: 60,
          backgroundColor: Colors.transparent,
          color:const Color.fromARGB(255, 180, 180, 180),
          items: const [
            Icon(Icons.camera_alt_outlined),
            Icon(Icons.flip_camera_ios_outlined),
          ]),
    );
  }
}

