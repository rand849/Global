// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class SettingWidget extends StatefulWidget {
  const SettingWidget ({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}
class _SettingWidgetState extends State<SettingWidget>{
  var Language;
  final List locale=[
    {'name':'English','locale': const Locale('en','US')},
    {'name':'العربية','locale': const Locale('ar','lb')},
  ];
  updatelanguage(Locale locale){
   Get.back();
   Get.updateLocale(locale);
  }
  builddialoug(BuildContext context){
    showDialog
    (context: context,
     builder: (builder){
      return AlertDialog(
        title:const Text('Choose Language'),
        content: Container(
          width:double.maxFinite,
          child:ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:() {
                   // ignore: avoid_print
                   print(locale[index]['name']);
                   updatelanguage(locale[index]['locale']);
                  },
                  child: Text(
                    locale[index]['name']
                    ),
                ),
              );
            },
             separatorBuilder: (context,index){
              return const Divider(
                color: Colors.green,
              );
             },
              itemCount:locale.length)
        ),
      );
     });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 263,
          height: double.infinity,
          color: const Color(0xBEC5C5C5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 24,
                    height: 19,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22.40),
              ElevatedButton(onPressed: (){
               builddialoug(context);
              },
              style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 209, 209, 209),
              textStyle: GoogleFonts.robotoSerif(
                fontSize: 18,
              )
          ),
              child:Text("lang".tr),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
