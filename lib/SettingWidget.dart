// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';



class SettingWidget extends StatefulWidget {
  const SettingWidget ({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}
class _SettingWidgetState extends State<SettingWidget>{
  var Language;

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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF4D4D4D),
                ),
                margin: const EdgeInsets.only(
                  top: 35,
                  left: 25,
                  right: 15,
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(8),
                    underline: const Divider(color: Colors.transparent),
                    dropdownColor: const Color(0xFF4D4D4D),
                    iconSize: 30,
                    isExpanded: true,
                    hint: const Text("Choose Language "),
                    items: ["English", "العربية"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                        onChanged: (val) {
                                setState(() {
                                Language = val.toString();
                                });
                              },
                    
                    value: Language,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
