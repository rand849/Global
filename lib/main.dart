// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, depend_on_referenced_packages, avoid_returning_null_for_void

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalidoc/firebase_options.dart';
import 'package:globalidoc/translation/localString.dart';
import 'ui/WelcomeWidget.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const GlobalIDoc());
  }


class GlobalIDoc extends StatelessWidget {
  const GlobalIDoc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale:Locale('en','US') ,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: const [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: WelcomeWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






