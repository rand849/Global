// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'NotifyCameraWidget.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});


  @override
  State<PayWidget> createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
 var Credit;
 var Month;
 var year;

  GlobalKey<FormFieldState> FormA =  GlobalKey<FormFieldState>();

   send() {
      var formdata = FormA.currentState;
      if (formdata!.validate()) {
        formdata.save();
        print("IDnum=$Credit");
      
      } else {
        print("not valid");
      }
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: const Image(
                image: AssetImage('images/back1.jpg'),
                fit: BoxFit.cover,
              )),
            SingleChildScrollView(
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(top:70,left: 10),
                    child: 
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                      width: 300,
                      height: 60,
                      child:  Text(
                        "pay".tr,
                        style: GoogleFonts.robotoSerif(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  ),
                  
                  Form(
                    key: FormA,
                    child: Column(
                      children: [
                       
                        Padding(
                          padding:const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 209, 209, 209),
                                ),
                                 padding: const EdgeInsets.only(left: 20),
                                       margin: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      //   right: 180,
                                       ),
                                child: DropdownButton(
                                  
                                  borderRadius: BorderRadius.circular(8),
                                  underline: const Divider(color: Colors.transparent),
                                  dropdownColor: const Color.fromARGB(255, 209, 209, 209),
                                  iconSize: 40,
                                
                                  hint:  Text(
                                    "Type".tr,
                                    style: GoogleFonts.robotoSerif(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  items: [
                                    "VisaCard",
                                    "MasterCard",
                                    "American Express"
                                  ].map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                      onChanged: (val) {
                              print("changed");
                              setState(() {
                               Credit = val.toString();
                              });
                            },
                                 
                                  value: Credit,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                   padding: const EdgeInsets.only(left: 20,top: 10,),
                                       margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top:5,
                                       ),
                                  child: TextFormField(
                                    onSaved: (text) {
                                      Credit = text!;
                                    },
                                    
                                    style: const TextStyle(fontSize: 15),
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.number,
                                    minLines: 1,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      
                                      hintText: "cvc".tr,
                                      hintStyle: GoogleFonts.robotoSerif(
                                        fontSize: 14,
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(255, 209, 209, 209),
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 2,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Container(
                          padding: const EdgeInsets.only(top: 25, left: 35, right: 35),
                          child: TextFormField(
                            onSaved: (text) {
                              Credit = text!;
                            },
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              labelText: "name".tr,
                              labelStyle: GoogleFonts.robotoSerif(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 209, 209, 209),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
                            child: TextFormField(
                              onSaved: (text) {
                                Credit = text!;
                              },
                              style: const TextStyle(fontSize: 15),
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.number,
                              minLines: 1,
                              maxLines: 2,
                              decoration: InputDecoration(
                                labelText: 'number'.tr,
                                labelStyle: GoogleFonts.robotoSerif(
                                  fontSize: 14,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 209, 209, 209 ),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    )),
                              ),
                            )),
                         Container(
                          margin:const  EdgeInsets.only(top:30,bottom: 30,right:195),
                          child : Text(
                            'Date'.tr,
                            style:GoogleFonts.robotoSerif(
                              fontSize:21,
                              fontWeight: FontWeight.w400,
                              
                            ),
                          ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8,left: 8, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(255, 209, 209, 209),
                                      ),
                                       padding: const EdgeInsets.only(left: 20),
                                       margin: const EdgeInsets.only(
                                        left: 10,
                                       ),
                                      child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        underline: const Divider(color: Colors.transparent),
                                        dropdownColor: const Color.fromARGB(255, 209, 209, 209),
                                        iconSize: 40,
                                        isExpanded: true,
                                        hint: Text(
                                          "Month".tr,
                                          style: GoogleFonts.robotoSerif(
                                            color: const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 14,
                                          ),
                                          textDirection: TextDirection.ltr,
                                        ),
                                        items: [
                                          "January",
                                          "February",
                                          "March",
                                          "April",
                                          "May",
                                          "June",
                                          "July",
                                          "August",
                                          "September",
                                          "October",
                                          "November",
                                          "December"
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        
                                        onChanged: (val) {
                              print("changed");
                              setState(() {
                                Month = val.toString();
                              });
                            },
                                        value: Month,
                                      ),
                                    ),
                                  ),
                                ),
                                 Expanded(
                                   child: Padding(
                                     padding: const EdgeInsets.only(bottom: 8,left: 8, right: 8),
                                     child: Container(
                                       decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(255, 209, 209, 209),
                                       ),
                                       padding: const EdgeInsets.only(
                                      left: 20,
                                       ),
                                       margin: const EdgeInsets.only(
                                        left: 10),
                                       child: DropdownButton(
                                      borderRadius: BorderRadius.circular(8),
                                      underline: const Divider(color: Colors.transparent),
                                      dropdownColor: const Color.fromARGB(255, 209, 209, 209),
                                      iconSize: 40,
                                      isExpanded: true,
                                      hint: Text(
                                        "Year".tr,
                                        style: GoogleFonts.robotoSerif(
                                          color: const Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                      items: [
                                        "2023",
                                        "2024",
                                        "2025",
                                        "2026",
                                        "2027",
                                        "2028",
                                      ]
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                          onChanged: (val) {
                              print("changed");
                              setState(() {
                                year = val.toString();
                              });
                            },
                                      value: year,
                                       ),
                                     ),
                                   ),
                                 ),
                              ],
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top:18),
                    width: 125,
                    height: 50,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(20),
                           boxShadow: const [
                            BoxShadow(
                            
                            color: Color.fromARGB(255, 180, 180, 180),
                            )]
                       ),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child:  Text(
                          "Next".tr,
                          style: GoogleFonts.robotoSerif(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                        width: 100,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotifiyCameraWidget()));
                        print("object");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
