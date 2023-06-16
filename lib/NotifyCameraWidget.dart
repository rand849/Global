// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:globalidoc/CameraWidget.dart';

class NotifiyCameraWidget extends StatelessWidget {
  const NotifiyCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              height: 300,
              width: 300,
              margin: const EdgeInsets.only(top: 200, left: 25),
              child: const Text(
                "\nPlease take a picture \nto verify your identity,\n                                            We appreciate your \npatience.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
            width: 190,
            height: 90,
            margin: const EdgeInsets.only(
                left: 150, right: 37, top: 380, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1,
                            color: Color.fromARGB(255, 114, 114, 114),
                          )
                        ]),
                    alignment: Alignment.center,
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Open Camera",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraWidget(
                          cameras: value,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      );
    });
  }
}
