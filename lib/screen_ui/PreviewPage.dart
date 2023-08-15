// ignore_for_file: file_names, avoid_returning_null_for_void, sized_box_for_whitespace, prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../ui/CameraWidget.dart';
import '../ui/FinalWidget.dart';
import '../ui/NotifiySignatureWidget.dart';
import '../ui/SignatureWidget.dart';
import '../Storage/storage_service.dart';




class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    final Storage storage=Storage();
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
          Text(widget.picture.name),
          Container(
            child: ElevatedButton(onPressed:()async {
              final result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['jpg'],
              );
              if (result == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No File Selected")),
                );
                return null;
              }
              final path =result.files.single.path!;
              final fileName=result.files.single.name;

              storage
                  .uploadFile(path,fileName)
                  .then((value) => print("Done"));
            },
            child:const  Text("Upload Photo"),
            )
          ),
      // FutureBuilder(
      //   future: storage.listFiles(),
      //   builder: (BuildContext context, AsyncSnapshot <firebase_storage.ListResult> snapshot){
      //    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
      //     return Container(
      //       height: 100,
      //       child : ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         shrinkWrap: true,
      //         itemCount: snapshot.data!.items.length,
      //         itemBuilder: (BuildContext context , int index){
      //          return  ElevatedButton(
      //           onPressed: (){},
      //           child:Text(snapshot.data!.items[index].name) );
      //         })
      //     );
      //    }
      //    if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
      //     return const CircularProgressIndicator();
      //    }
      //    return Container();
      //   }
      // ),
      // FutureBuilder(
      //   future: storage.downloadURL("DSC_3697"),
      //   builder: (BuildContext context, AsyncSnapshot <String> snapshot){
      //    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
      //     return Container(
      //       width: 300,
      //       height:250,
      //       child: Image.network(
      //         snapshot.data!,
      //         fit: BoxFit.cover,
      //       ),
      //     ) ;
      //    }
      //    if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
      //     return CircularProgressIndicator();
      //    }
      //    return Container();
      //   }
      // ),
        ]
        ),
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
              color: Colors.green,
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
              color: Colors.green,
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
