// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:globalidoc/NotifyCameraWidget.dart';

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
                      child: const Text(
                        " Payment Method :",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                                  color: const Color.fromARGB(162, 109, 109, 109),
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
                                  dropdownColor: const Color.fromARGB(255, 109, 109, 109),
                                  iconSize: 40,
                                
                                  hint: const Text(
                                    "Type ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
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
                                      //   top: 35,
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
                                      
                                      hintText: "CVC Code",
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(162, 109, 109, 109),
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
                              hintText: "Card Holder Name",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(162, 109, 109, 109),
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
                                hintText: "Credit Card Code",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(162, 109, 109, 109),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    )),
                              ),
                            )),
                            const Padding(
                              padding: EdgeInsets.only(top:25,left: 15),
                              child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 200,
                      height: 60,
                      child: Text(
                        " Expiration Date :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
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
                                        color: const Color.fromARGB(162, 109, 109, 109),
                                      ),
                                       padding: const EdgeInsets.only(left: 20),
                                       margin: const EdgeInsets.only(
                                      //   top: 35,
                                        left: 10,
                                      //   right: 180,
                                       ),
                                      child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        underline: const Divider(color: Colors.transparent),
                                        dropdownColor: const Color.fromARGB(255, 109, 109, 109),
                                        iconSize: 40,
                                        isExpanded: true,
                                        hint: const Text(
                                          "Month ",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
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
                                      color: const Color.fromARGB(162, 109, 109, 109),
                                       ),
                                       padding: const EdgeInsets.only(
                                      left: 20,
                                       ),
                                       margin: const EdgeInsets.only(
                                        left: 10),
                                       child: DropdownButton(
                                      borderRadius: BorderRadius.circular(8),
                                      underline: const Divider(color: Colors.transparent),
                                      dropdownColor: const Color.fromARGB(255, 109, 109, 109),
                                      iconSize: 40,
                                      isExpanded: true,
                                      hint: const Text(
                                        "Year ",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
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
                            
                            color: Color.fromARGB(255, 158, 158, 158),
                            )]
                       ),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Next ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
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
