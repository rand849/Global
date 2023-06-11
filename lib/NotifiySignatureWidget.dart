// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'SignatureWidget.dart';


class NotifiySignatureWidget extends StatelessWidget {
  const NotifiySignatureWidget({super.key});

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
                // Container(
                //   height:400,
                //   width:400,
                //   child: Lottie.network("https://lottiefiles.com/99614-signature"),
                // ),
               Container(
                height: 300,
                width:300,
                margin: const EdgeInsets.only(top:200,left:25),
                child:const Text( 
                  "Write your Signature in the air.",
                  style:TextStyle(
                    fontStyle:FontStyle.italic,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                )
               ),
               Container(
                     width: 200,
                      height: 90,
                      margin: const EdgeInsets.only(
                              left:190, right: 37, top: 370, bottom: 10),
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(10,20,0,0),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,0,0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 109, 109, 109),
                            ),
                            alignment: Alignment.center,
                            // ignore: sort_child_properties_last
                            child: 
                            const Text(
                              "Open Camera",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ), 
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignatureWidget()));
                        },
                      ),
                      ),
        ),
          ]),
        );
      }
    );
  }
}
