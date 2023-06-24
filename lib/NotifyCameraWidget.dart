// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:globalidoc/CameraWidget.dart';
import 'package:lottie/lottie.dart';

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
                image: AssetImage('images/back1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
         Container(
            margin: const EdgeInsets.only(left:50,top:80),
            height:250,
            width:250,
            child: Lottie.asset("lottie/selfie.json"),
          ),
          Container(
              height: 300,
              width: 300,
              margin: const EdgeInsets.only(top: 330, left: 25),
              child: const Text(
                "\nPlease take a picture \nto verify your identity,\n                                            We appreciate your \npatience.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
            width: 170,
            height: 80,
            margin: const EdgeInsets.only(
                left: 150, right: 37, top: 510, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                       
                            color: Color.fromARGB(255, 161, 161, 161),
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