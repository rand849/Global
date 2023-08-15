// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:dropdown_search/dropdown_search.dart';
import 'package:globalidoc/signin_back/model/user.dart';
import 'package:globalidoc/signin_back/controller/signup_controller.dart';
import 'package:globalidoc/signin_back/user_repository.dart';
import 'package:globalidoc/ui/PayWidget.dart';
import 'package:globalidoc/ui/SettingWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  var IDnum;
  var Nationalty;
  var Town;
  var Doc;
  var Email;

  final _nationaltyController = TextEditingController();
  final _docController = TextEditingController();
  final _emailController = TextEditingController();
  final _IDController = TextEditingController();
  final controller = Get.put(SignUpController());
  final _formfield = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final userRepo = Get.put(UserRepository());
 

  send() {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("Nationalty=$Nationalty");
    } else {
      print("not valid");
    }
  }

  @override
  void dispose() {
    _nationaltyController.dispose();
    _docController.dispose();
    _emailController.dispose();
    _IDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 30,
            ),
          ),
          drawer: const SettingWidget(),
          body: Material(
              child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/back.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        margin: const EdgeInsets.only(right: 20, top: 10),
                        width: 300,
                        height: 100,
                        child: const Image(
                          image: AssetImage('images/logo.png'),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 15, left: 35, right: 35),
                          child: TextFormField(
                            controller: _IDController,
                            onChanged: (text) {
                              IDnum = text;
                            },
                            validator: (text) {
                              if (text!.length < 9) {
                                return "* must be more than 9 numbers";
                              } else if (text.isEmpty) {
                                return "Enter ID Number";
                              }

                              return null;
                            },
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.picture_in_picture),
                              prefixIconColor: (Colors.black),
                              labelText: "hello".tr,
                              labelStyle: GoogleFonts.robotoSerif(
                                color: Colors.black,
                              ),
                              hintText: "Not less than 9 numbers".tr,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 209, 209, 209),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 209, 209, 209),
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 2, left: 5, right: 35),
                        margin:
                            const EdgeInsets.only(left: 32, right: 37, top: 20),
                        child: DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            menuProps: MenuProps(
                              elevation: 1,
                              backgroundColor:
                                  Color.fromARGB(255, 209, 209, 209),
                            ),
                            showSearchBox: true,
                            showSelectedItems: true,
                          ),
                          items: [
                            "Afghanistan".tr,
                            "Albania".tr,
                            "Algeria".tr,
                            "Andorra".tr,
                            "Angola".tr,
                            "Antigua & Barbuda".tr,
                            "Argentina".tr,
                            "Armenia".tr,
                            "Australia".tr,
                            "Austria".tr,
                            "Azerbaijan".tr,
                            "The Bahamas".tr,
                            "Bahrin".tr,
                            "Bangladesh".tr,
                            "Barbados".tr,
                            "Belarus".tr,
                            "Belgium".tr,
                            "Belize".tr,
                            "Benin".tr,
                            "Bhutan".tr,
                            "Bolivia".tr,
                            "Bosnia & Herzegovina".tr,
                            "Botswana".tr,
                            "Brazil".tr,
                            "Brunei".tr,
                            "Bulgaria".tr,
                            "Burkina Faso".tr,
                            "Burundi".tr,
                            "Cambodia".tr,
                            "Cameroon".tr,
                            "Canada".tr,
                            "Cape Verde ".tr,
                            "Central African Republic ".tr,
                            "Chad ".tr,
                            "Chile".tr,
                            "China".tr,
                            "Colombia".tr,
                            "Comoros".tr,
                            "Republic of the Congo".tr,
                            "Democratic Republic of the Congo ".tr,
                            "Costa Rica".tr,
                            "Cote d’Ivoire".tr,
                            "Croatia".tr,
                            "Cuba".tr,
                            "Cyprus".tr,
                            "Czech Republic".tr,
                            "Denmark".tr,
                            "Djibouti".tr,
                            "Dominica".tr,
                            "Dominican Republic".tr,
                            "East Timor".tr,
                            "Ecuador".tr,
                            "Egypt".tr,
                            "El Salvador".tr,
                            "Equatorial Guinea".tr,
                            "Eritrea".tr,
                            "Estonia".tr,
                            "Ethiopia".tr,
                            "Fiji".tr,
                            "Finland".tr,
                            "France".tr,
                            "Gabon".tr,
                            "The Gambia".tr,
                            "Georgia".tr,
                            "Germany".tr,
                            "Ghana".tr,
                            "Greece".tr,
                            "Grenada".tr,
                            "Guatemala".tr,
                            "Guinea".tr,
                            "Guinea Bissau".tr,
                            "Guyana".tr,
                            "Haiti".tr,
                            "Honduras".tr,
                            "Hungary".tr,
                            "Iceland".tr,
                            "India".tr,
                            "Indonesia".tr,
                            "Iran".tr,
                            "Iraq".tr,
                            "Ireland".tr,
                            "Italy".tr,
                            "Jamaica".tr,
                            "Japan".tr,
                            "Jordan".tr,
                            "Kazakhstan".tr,
                            "Kenya".tr,
                            "Kiribati".tr,
                            "Korea".tr,
                            "Kuwait".tr,
                            "Kyrgyzstan".tr,
                            "Laos".tr,
                            "Latvia".tr,
                            "Lebanon".tr,
                            "Lesotho".tr,
                            "Liberia".tr,
                            "Libya".tr,
                            "Liechtenstein".tr,
                            "Lithuania".tr,
                            "Luxembourg".tr,
                            "Macedonia".tr,
                            "Madagascar".tr,
                            "Malawi".tr,
                            "Malaysia".tr,
                            "Maldives".tr,
                            "Mali".tr,
                            "Malta".tr,
                            "Marshall Islands".tr,
                            "Mauritania".tr,
                            "Mauritius".tr,
                            "Mexico".tr,
                            "Federated States of Micronesia".tr,
                            "Moldova".tr,
                            "Monaco".tr,
                            "Mongolia".tr,
                            "Montenegro".tr,
                            "Morocco".tr,
                            "Mozambique".tr,
                            "Myanmar (Burma)".tr,
                            "Namibia".tr,
                            "Nauru".tr,
                            "Nepal".tr,
                            "Netherlands".tr,
                            "New Zealand".tr,
                            "Nicaragua".tr,
                            "Niger".tr,
                            "Nigeria".tr,
                            "Norway".tr,
                            "Oman".tr,
                            "Pakistan".tr,
                            "Palau".tr,
                            "Palestine".tr,
                            "Panama".tr,
                            "Papua New Guinea".tr,
                            "Paraguay".tr,
                            "Peru".tr,
                            "Philippines".tr,
                            "Poland".tr,
                            "Portugal".tr,
                            "Qatar".tr,
                            "Romania".tr,
                            "Russia".tr,
                            "Rwanda".tr,
                            "Saint Kitts and Nevis".tr,
                            "Saint Lucia".tr,
                            "Saint Vincent and the Grenadines".tr,
                            "Samoa".tr,
                            "San Marino".tr,
                            "Sao Tome and Principe".tr,
                            "Saudi Arabia".tr,
                            "Senegal".tr,
                            "Serbia".tr,
                            "Seychelles".tr,
                            "Sierra Leone".tr,
                            "Singapore".tr,
                            "Slovakia".tr,
                            "Slovenia".tr,
                            "Solomon Islands".tr,
                            "Somalia".tr,
                            "South Africa".tr,
                            "Spain".tr,
                            "Sri Lanka".tr,
                            "Sudan".tr,
                            "Suriname".tr,
                            "Swaziland".tr,
                            "Sweden".tr,
                            "Switzerland".tr,
                            "Syria".tr,
                            "Tajikistan".tr,
                            "Tanzania".tr,
                            "Thailand".tr,
                            "Togo".tr,
                            "Tonga".tr,
                            "Trinidad and Tobago".tr,
                            "Tunisia".tr,
                            "Turkey".tr,
                            "Turkmenistan".tr,
                            "Tuvalu".tr,
                            "Uganda".tr,
                            "Ukraine".tr,
                            "United Arab Emirates".tr,
                            "United Kingdom".tr,
                            "United States".tr,
                            "Uruguay".tr,
                            "Uzbekistan".tr,
                            "Vanuatu".tr,
                            "Vatican City (Holy Seed)".tr,
                            "Venezuela".tr,
                            "Vietnam".tr,
                            "Yemen".tr,
                            "Zambia".tr,
                            "Zimbabwe".tr,
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              focusColor: Colors.black,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              fillColor:
                                  const Color.fromARGB(255, 209, 209, 209),
                              prefixIcon: const Icon(Icons.flag),
                              prefixIconColor: (Colors.black),
                              labelText: "message".tr,
                              labelStyle: GoogleFonts.robotoSerif(
                                color: Colors.black,
                              ),
                              hintText: "hint1".tr,
                            ),
                          ),
                          onChanged: (val) {
                            print(val);
                            setState(() {
                              Town = val;
                            });
                          },
                        ),
                      ),
                    ]),
                  ),
                  Form(
                    key: _formfield,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 35, left: 35, right: 35),
                          child: TextFormField(
                            controller: _emailController,
                            onSaved: (text) {
                              Email = text;
                            },
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.emailAddress,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              prefixIconColor: (Colors.black),
                              labelText: "another".tr,
                              labelStyle: GoogleFonts.robotoSerif(
                                color: Colors.black,
                              ),
                              hintText: "@gmail.com",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 209, 209, 209),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  )),
                            ),
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{}+@[a-zA-z0-9]+\.[a-zA-Z]+]")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return "Enter Email";
                              }

                              if (!emailValid) {
                                return "Enter Valid Email";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 209, 209, 209),
                          ),
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 20, right: 10),
                          margin: const EdgeInsets.only(
                            top: 35,
                            left: 35,
                            right: 35,
                          ),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(8),
                            underline: const Divider(color: Colors.transparent),
                            dropdownColor:
                                const Color.fromARGB(255, 209, 209, 209),
                            iconSize: 40,
                            isExpanded: true,
                            hint: Text(
                              "Document".tr,
                              style: GoogleFonts.robotoSerif(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                            items: [
                              "doc1".tr,
                              "doc2".tr,
                              "doc3".tr,
                              'doc4'.tr,
                            ]
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              print("changed");
                              setState(() {
                                Doc = val.toString();
                              });
                            },
                            value: Doc,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 130,
                    height: 80,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                )
                              ]),
                          alignment: Alignment.center,
                          // ignore: sort_child_properties_last
                          child: Text(
                            "Sign".tr,
                            style: GoogleFonts.robotoSerif(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          width: 100,
                          height: 50,
                        ),
                      ),
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final users = UserModel(
                            IDnum: _IDController.text.trim(),
                            nationalty: _nationaltyController.text.trim(),
                            document: _docController.text.trim(),
                            email: _emailController.text.trim(),
                          );
                          SignUpController.instance.createUser(users);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PayWidget()));
                        print("object");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ])));
    });
  }
}
