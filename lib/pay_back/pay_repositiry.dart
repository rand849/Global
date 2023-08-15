import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globalidoc/pay_back/model/pay.dart';


class PayRepository {
  static Future addUser(PayModel pay) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('employee')
          .doc(currentUser.uid)
          .set(pay.toJson());
    }
  }
}
