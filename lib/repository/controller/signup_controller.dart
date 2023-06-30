
import 'package:get/get.dart';
import 'package:globalidoc/model/user.dart';
import 'package:globalidoc/repository/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel users) async {
   await userRepo.createUser(users);
  }
}