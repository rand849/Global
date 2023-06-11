// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
          decoration:const BoxDecoration( image:DecorationImage(
            image:AssetImage('images/background.jpg'),
            fit: BoxFit.fill,
            ),
        ),),   
               Container(
                height: 300,
                width:300,
                margin: const EdgeInsets.only(top:210,left:25),
                child:const Text(
                  "Thanks for reaching out.\n                                           You will get notified\nwhen your document is ready.",
                  style:TextStyle(
                    fontStyle:FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                )
               ),
          ]),
        );
      }
    );
  }
}


