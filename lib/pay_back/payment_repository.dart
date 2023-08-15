import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globalidoc/pay_back/model/pay.dart';



class PaymentRepository extends GetxController{
  static PaymentRepository get instance=>Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(PayModel pay) async {
    await _db.collection("payment").add(pay.toJson()).whenComplete(()
     => Get.snackbar("Sucess", "Payment completed successfully",
     snackPosition: SnackPosition.BOTTOM,
     backgroundColor:const Color.fromARGB(255, 209, 209, 209),
     colorText: Colors.green),
     // ignore: body_might_complete_normally_catch_error
     ).catchError((error,stackTrace){
      Get.snackbar("Error","Something went wrong ,Try again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      // ignore: avoid_print
      print(error.toString());
     });
  }
}