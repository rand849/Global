// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:globalidoc/SigninWidget.dart';


class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

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
            image:AssetImage('images/welcome.jpg'),
            fit: BoxFit.fill,
            ),
        ),),
               Container(
                     width: 125,
                      height:50,
                      margin: const EdgeInsets.only(
                              left:130, right: 37, top: 200,),
                      decoration: BoxDecoration(
                           border: Border.all(
                            color: Colors.black,
                            width:2,
                           ),
                           borderRadius: BorderRadius.circular(40),
                           boxShadow: const [
                            BoxShadow(
                            blurRadius: 1,
                            color: Colors.white,
                            )]
                       ),
                        padding: const EdgeInsets.fromLTRB(12,11,0,0),
                      child: InkWell(
                        child: const Text(
                          "Get Started ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SigninWidget()));   
                        },
                      ),
                      ),
          ]),
        );
      }
    );
  }
}