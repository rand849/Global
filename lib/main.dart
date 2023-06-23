// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, depend_on_referenced_packages, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:globalidoc/WelcomeWidget.dart';


void main() {
  runApp(const GlobalIDoc());
}

class GlobalIDoc extends StatelessWidget {
  const GlobalIDoc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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





