
import 'package:get/get.dart';
import 'package:globalidoc/pay_back/model/pay.dart';


import '../payment_repository.dart';


class PaymentController extends GetxController{
  static PaymentController get instance => Get.find();

  final userRepo = Get.put(PaymentRepository());

  Future<void> createUser(PayModel pay) async {
   await userRepo.createUser(pay);
  }
}