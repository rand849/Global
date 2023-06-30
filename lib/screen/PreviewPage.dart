// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import '../CameraWidget.dart';
import '../FinalWidget.dart';
import '../NotifiySignatureWidget.dart';
import '../SignatureWidget.dart';


class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        title:  Text(
          "Preview".tr,
          style: GoogleFonts.robotoSerif(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(192, 233, 232, 232),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(widget.picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(widget.picture.name)
        ]),
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );

  Widget buildHeader(BuildContext context) => Container(
        color:const  Color.fromARGB(190,49, 214, 145),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading:
                  const Icon(Icons.party_mode_outlined, color: Colors.black),
              title:  Text("retake".tr,
                            style: GoogleFonts.robotoSerif(
                            fontSize: 16,
              ),),
              onTap: () async {
                await availableCameras().then(
                  (value) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CameraWidget(cameras: value),
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(Icons.history_edu, color: Colors.black),
              title: Text("signature".tr,
                            style: GoogleFonts.robotoSerif(
                            fontSize: 16,
              ),),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const NotifiySignatureWidget()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh_outlined, color: Colors.black),
              title: Text("redo".tr,
                            style: GoogleFonts.robotoSerif(
                            fontSize: 16,
              ),),
              onTap: () async {
                await availableCameras().then(
                  (value) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignatureWidget(cameras: value),
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading:
                  const Icon(Icons.check_circle_outline, color: Colors.black),
              title:  Text("done".tr,
                            style: GoogleFonts.robotoSerif(
                            fontSize: 16,
              ),),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const FinalWidget()));
              },
            ),
          ],
        ),
      );
}
