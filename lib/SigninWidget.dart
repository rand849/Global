
// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:dropdown_search/dropdown_search.dart';
import 'package:globalidoc/PayWidget.dart';
import 'package:globalidoc/SettingWidget.dart';


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
  final _formfield=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final IDController=TextEditingController();
  GlobalKey<FormFieldState> FormF =  GlobalKey<FormFieldState>();
  
  send() {
      var formdata = FormF.currentState;
      if (formdata!.validate()) {
        formdata.save();
        print("Nationalty=$Nationalty");
      } else {
        print("not valid");
      }
    }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                    size: 30,
                  ),
                ),
          drawer: const SettingWidget(),
          body:
          SafeArea(
         child: Material(
        child: Stack(
          children: [
              Container(
                   height: double.infinity,
                    width:double.infinity,
                    decoration:const BoxDecoration( 
                        image:DecorationImage(
                        image:AssetImage('images/back.jpg'),
                        fit: BoxFit.fill,
                          ),
                        ),
                      ),

            SingleChildScrollView(
            child: Column(
              
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(right:20, top:10),
                    width:300,
                      height:100,
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
                  key: FormF,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 15, left: 35, right: 35),
                          child: TextFormField(
                            controller: IDController,
                            onChanged: (text) {
                              IDnum = text;
                            },
                            validator: (text) {
                              if (text!.length < 9) {
                                return "* must be more than 9 numbers";
                              }
                              else if(text.isEmpty){
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
                              labelText: "ID Number",
                              labelStyle:const TextStyle(
                                color: Colors.black,
                              ),
                              hintText: "Not less than 9 numbers",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(162, 109, 109, 109),
                        ),
                        padding:
                            const EdgeInsets.only(bottom: 2, left: 5, right: 35),
                        margin: const EdgeInsets.only(
                            left: 32, right: 37, top: 20),
                        child:
                         DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                              menuProps: MenuProps(
                                elevation: 1,
                                backgroundColor:Color.fromARGB(255, 151, 151, 151), 
                              ),
                              showSearchBox: true,
                              showSelectedItems: true,
                              ),
                         items: const [
                            "Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua & Barbuda",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "The Bahamas",
                            "Bahrin",
                            "Bangladesh",
                            "Barbados",
                            "Belarus",
                            "Belgium",
                            "Belize",
                            "Benin",
                            "Bhutan",
                            "Bolivia",
                            "Bosnia & Herzegovina",
                            "Botswana",
                            "Brazil",
                            "Brunei",
                            "Bulgaria",
                            "Burkina Faso",
                            "Burundi",
                            "Cambodia",
                            "Cameroon",
                            "Canada",
                            "Cape Verde ",
                            "Cape Verde ",
                            "Central African Republic ",
                            "Chad ",
                            "Chile",
                            "China",
                            "Colombia",
                            "Comoros",
                            "Republic of the Congo",
                            "Democratic Republic of the Congo ",
                            "Costa Rica",
                            "Cote d’Ivoire",
                            "Croatia",
                            "Cuba",
                            "Cyprus",
                            "Czech Republic",
                            "Denmark",
                            "Djibouti",
                            "Dominica",
                            "Dominican Republic",
                            "East Timor",
                            "Ecuador",
                            "Egypt",
                            "El Salvador",
                            "Equatorial Guinea",
                            "Eritrea",
                            "Estonia",
                            "Ethiopia",
                            "Fiji",
                            "Finland",
                            "France",
                            "Gabon",
                            "The Gambia",
                            "Georgia",
                            "Germany",
                            "Ghana",
                            "Greece",
                            "Grenada",
                            "Guatemala",
                            "Guinea",
                            "Guinea Bissau",
                            "Guyana",
                            "Haiti",
                            "Honduras",
                            "Hungary",
                            "Iceland",
                            "India",
                            "Indonesia",
                            "Iran",
                            "Iraq",
                            "Ireland",
                            "Italy",
                            "Jamaica",
                            "Japan",
                            "Jordan",
                            "Kazakhstan",
                            "Kenya",
                            "Kiribati",
                            "Korea",
                            "Kuwait",
                            "Kyrgyzstan",
                            "Laos",
                            "Latvia",
                            "Lebanon",
                            "Lesotho",
                            "Liberia",
                            "Libya",
                            "Liechtenstein",
                            "Lithuania",
                            "Luxembourg",
                            "Macedonia",
                            "Madagascar",
                            "Malawi",
                            "Malaysia",
                            "Maldives",
                            "Mali",
                            "Malta",
                            "Marshall Islands",
                             "Mauritania",
                            "Mauritius",
                            "Mexico",
                            "Federated States of Micronesia",
                            "Moldova",
                            "Monaco",
                            "Mongolia",
                            "Montenegro",
                            "Morocco",
                            "Mozambique",
                            "Myanmar (Burma)",
                            "Namibia",
                            "Nauru",
                            "Nepal",
                            "Netherlands",
                            "New Zealand",
                            "Nicaragua",
                            "Niger",
                            "Nigeria",
                            "Norway",
                            "Oman",
                            "Pakistan",
                            "Palau",
                            "Palestine",
                            "Panama",
                            "Papua New Guinea",
                            "Paraguay",
                            "Peru",
                            "Philippines",
                            "Poland",
                            "Portugal",
                            "Qatar",
                            "Romania",
                            "Russia",
                            "Rwanda",
                            "Saint Kitts and Nevis",
                            "Saint Lucia",
                            "Saint Vincent and the Grenadines",
                            "Samoa",
                            "San Marino",
                            "Sao Tome and Principe",
                            "Saudi Arabia",
                            "Senegal",
                            "Serbia",
                            "Seychelles",
                            "Sierra Leone",
                            "Singapore",
                            "Slovakia",
                            "Slovenia",
                            "Solomon Islands",
                            "Somalia",
                            "South Africa",
                            "Spain",
                            "Sri Lanka",
                            "Sudan",
                            "Suriname",
                            "Swaziland",
                            "Sweden",
                            "Switzerland",
                            "Syria",
                            "Tajikistan",
                            "Tanzania",
                            "Thailand",
                            "Togo",
                            "Tonga",
                            "Trinidad and Tobago",
                            "Tunisia",
                            "Turkey",
                            "Turkmenistan",
                            "Tuvalu",
                            "Uganda",
                            "Ukraine",
                            "United Arab Emirates",
                            "United Kingdom",
                            "United States",
                            "Uruguay",
                            "Uzbekistan",
                            "Vanuatu",
                            "Vatican City (Holy Seed)",
                            "Venezuela",
                            "Vietnam",
                            "Yemen",
                            "Zambia",
                            "Zimbabwe",
                                ],
                              dropdownDecoratorProps: const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  focusColor:Colors.black ,
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  fillColor: Color.fromARGB(255, 109, 109, 109),
                                  prefixIcon: Icon(Icons.flag),
                                  prefixIconColor: (Colors.black),
                                  labelText: "Nationalty",
                                  labelStyle:TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: "HomeTown Country",
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
                    ]
                                        
                        ),),
                  Form(
                        key:_formfield,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 35, left: 35, right: 35),
                              child: TextFormField(
                                controller: emailController,
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
                                  labelText: "Email Address",
                                  labelStyle:const TextStyle(
                                  color: Colors.black,
                                  ), 
                                  hintText: "@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  filled: true,
                                  fillColor:
                                     const Color.fromARGB(162, 109, 109, 109),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      )),
                                ),
                                validator: (value){
                                 bool emailValid= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{}+@[a-zA-z0-9]+\.[a-zA-Z]+]")
                                .hasMatch(value!);
                                  if(value.isEmpty){
                                    return "Enter Email";
                                  }

                                if(!emailValid){
                                  return "Enter Valid Email";
                                }
                                return null;
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:const Color.fromARGB(162, 109, 109, 109),
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
                                underline:
                                    const Divider(color: Colors.transparent),
                                dropdownColor:
                                    const Color.fromARGB(255, 109, 109, 109),
                                iconSize: 40,
                                isExpanded: true,
                                hint: const Text(
                                  "Document Type ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                                items: [
                                  "High School Diploma",
                                  "Middle School Diploma",
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
                  margin: const EdgeInsets.only(top:10),
                  width: 130,
                  height: 80,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          //  border: Border.all(
                          //   color: Colors.black,
                          //   width:2,
                          //  ),
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: const [
                            BoxShadow(
                            color: Color.fromARGB(255, 114, 114, 114),
                            )]
                       ),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Sign in ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        width: 100,
                        height: 50,
                      ),
                    ),
                    onTap: () {
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
        ),]))));
      }
    );
  }
}