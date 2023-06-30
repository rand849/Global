// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FinalWidget extends StatelessWidget {
  const FinalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
         body: 
        Stack(
          children:[
           Container(
            height: double.infinity,
          width:double.infinity,
          decoration:const BoxDecoration( 
            image:DecorationImage(
            image:AssetImage('images/back1.jpg'),
            fit: BoxFit.fill,
            ),
        ),
           ),
           Container(
            margin: const EdgeInsets.only(left: 75,top:100),
            height:200,
            width:200,
            child: Lottie.asset("lottie/done1.json"),
               ),  
               Container(
                height: 300,
                width:300,
                margin: const EdgeInsets.only(top:300,left:25),
                child: Text(
                  "message3".tr,
                  style:GoogleFonts.robotoSerif(
                    fontSize: 28,
                  ),
                )
               ),
          ]),
        );
      }
    );
  }
}


