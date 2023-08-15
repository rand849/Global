// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core; 

class Storage {
  final firebase_storage.FirebaseStorage storage=
  firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String fileName,
    String path,
  )async {
 File file=File (fileName);
 try{
  await storage.ref('selfie/$fileName').putFile(file);
 }on firebase_core.FirebaseException catch(e){
  print(e);
 }
  }
  Future<firebase_storage.ListResult>listFiles() async{
    firebase_storage.ListResult result =await storage.ref("selfie").listAll();
    
    result.items.forEach((firebase_storage.Reference ref) {print("Found file:$ref"); });
    return result;
  }
//  Future <String> downloadURL(String imageName) async{
//   String downloadURL =await storage.ref('selfie/$imageName').getDownloadURL();

//   return downloadURL;
//  }
}