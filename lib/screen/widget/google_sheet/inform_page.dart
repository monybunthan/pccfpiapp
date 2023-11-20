// ignore_for_file: library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, unused_local_variable, duplicate_ignore, body_might_complete_normally_nullable, non_constant_identifier_names, unused_import, unnecessary_this, avoid_print, constant_identifier_names, unused_field, prefer_final_fields, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, use_build_context_synchronously, prefer_const_declarations

import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pccfpi/screen/widget/theme/themes.dart';

import 'googlesheets.dart';
import 'sheetscolumn.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController engnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController daysController = new TextEditingController();
  TextEditingController monthsController = new TextEditingController();
  TextEditingController yearsController = new TextEditingController();
  TextEditingController finishController = new TextEditingController();
  TextEditingController databController = new TextEditingController();
  TextEditingController villageController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? _value = 1;

  TextEditingController testController = new TextEditingController();
  String? gender_ID;

  static const village_list = [
    "ខេត្តបាត់ដំបង",
    "ក្រុងកំពង់ចាម",
    "ខេត្តកំពង់ឆ្នាំង (ក្រុង)",
    "ខេត្តព្រះសីហនុ (កំពង់សោម)",
    "ខេត្តកំពង់ស្ពឺ",
    "ខេត្តកំពង់ធំ",
    "ខេត្តកំពត",
    "ខេត្តកោះកុង",
    "ខេត្តក្រចេះ",
    "ខេត្តប៉ៃលិន",
    "រាជធានីភ្នំពេញ",
    "ខេត្តតាកែវ",
    "ខេត្តព្រៃវែង",
    "ខេត្តពោធិសាត់",
    "ខេត្តសៀមរាប",
    "ខេត្តស្ទឹងត្រែង",
    "ខេត្តស្វាយរៀង",
    "ខេត្តឧត្ដរមានជ័យ",
    "ខេត្តព្រះវិហារ",
    "ខេត្តបន្ទាយមានជ័យ",
    "ខេត្តកណ្តាល",
    "ខេត្តរតនៈគិរី",
    "ខេត្តមណ្ឌលគិរី",
    "ខេត្តត្បូងឃ្មុំ",
  ];
  static const gender_list = [
    "ប្រុស",
    "ស្រី",
    "ផ្សេងៗ",
  ];
  static const country_list = [
    "ខ្មែរ",
    "ខ្មែរឥស្លាម",
    "កួយ",
    "ខ្មែរមោន",
    "ផ្សេងៗ",
  ];
  static const grend_list = [
    "ថ្នាក់ទី ០៩",
    "ថ្នាក់ទី ១០",
    "ថ្នាក់ទី ១១",
    "ថ្នាក់ទី ១២",
    "បញ្ចប់កម្រិតអនុវិទ្យាល័យ",
    "បញ្ចប់កម្រិតវិទ្យាល័យ",
  ];
  static const finish_list = [
    "វគ្គខ្លីចំនួន ០៣ខែ",
    "វគ្គខ្លីចំនួន ០៦ខែ",
    "កម្រិតបរិញ្ញាប័ត្ររង",
    "កម្រិតបរិញ្ញាប័ត្រ",
  ];
  @override
  Widget build(BuildContext context) {
    // List<String> country = [
    //   "ប្រុស",
    //   "ស្រី",
    //   "ផ្សេងៗ",
    // ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'ចុះឈ្មោះចូលរៀន',
            style: TextStyle(fontFamily: 'DG', color: color_rgb),
          ),
          leading: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.transparent, width: 0.8),
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: color_rgb,
              )),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/LogoPCC.png',
                          width: 140,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "អាចចុះឈ្មោះចូលរៀនបាន គ្រាន់តែបំពេញលក្ខខណ្ឌងាយៗ​ ដូចខាងក្រោម ៖​",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'DG',
                                color: color_rgb,
                                fontSize: 12)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'នាមឈ្មោះជាភាសាខ្មែរ ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                controller: firstnameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Fill';
                                  }
                                },
                                style: TextStyle(
                                  color: color_rgb,
                                  fontFamily: 'DG',
                                ),
                                cursorColor: color_rgb,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "នាមត្រកូល",
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "DG"),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(
                                      color: color_rgb,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(
                                      color: color_rgb,
                                      width: 0.8,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      firstnameController.clear();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/svg/cross_1.svg',
                                      width: 12,
                                      color: red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: lastnameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Fill';
                                  }
                                },
                                style: TextStyle(
                                  color: color_rgb,
                                  fontFamily: 'DG',
                                ),
                                cursorColor: color_rgb,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "នាមខ្លួន",
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "DG"),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(
                                      color: color_rgb,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(
                                      color: color_rgb,
                                      width: 0.8,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      lastnameController.clear();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/svg/cross_1.svg',
                                      width: 12,
                                      color: red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'ភេទ ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///
                        SizedBox(
                          height: 7,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   // ignore: prefer_const_literals_to_create_immutables
                        //   children: [
                        //     Text(
                        //       'ថ្ងៃខែឆ្នាំកំណើត​​ ៖',
                        //       style:
                        //           TextStyle(color: color_rgb, fontFamily: 'DG'),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: daysController,
                        //         keyboardType: TextInputType.number,
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Fill';
                        //           }
                        //         },
                        //         style: TextStyle(
                        //           color: color_rgb,
                        //           fontFamily: 'DG',
                        //         ),
                        //         cursorColor: color_rgb,
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           labelText: "ថ្ងៃ",
                        //           labelStyle: TextStyle(
                        //               color: color_rgb, fontFamily: "DG"),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //               width: 0.8,
                        //             ),
                        //           ),
                        //           suffix: GestureDetector(
                        //             onTap: () {
                        //               daysController.clear();
                        //             },
                        //             child: SvgPicture.asset(
                        //               'assets/svg/cross_1.svg',
                        //               width: 12,
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: monthsController,
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Fill';
                        //           }
                        //         },
                        //         style: TextStyle(
                        //           color: color_rgb,
                        //           fontFamily: 'DG',
                        //         ),
                        //         cursorColor: color_rgb,
                        //         keyboardType: TextInputType.number,
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           labelText: "ខែ",
                        //           labelStyle: TextStyle(
                        //               color: color_rgb, fontFamily: "DG"),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //               width: 0.8,
                        //             ),
                        //           ),
                        //           suffix: GestureDetector(
                        //             onTap: () {
                        //               monthsController.clear();
                        //             },
                        //             child: SvgPicture.asset(
                        //               'assets/svg/cross_1.svg',
                        //               width: 12,
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: yearsController,
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'Fill';
                        //           }
                        //         },
                        //         style: TextStyle(
                        //           color: color_rgb,
                        //           fontFamily: 'DG',
                        //         ),
                        //         cursorColor: color_rgb,
                        //         keyboardType: TextInputType.number,
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           labelText: "ឆ្នាំ",
                        //           labelStyle: TextStyle(
                        //               color: color_rgb, fontFamily: "DG"),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(2),
                        //             borderSide: BorderSide(
                        //               color: color_rgb,
                        //               width: 0.8,
                        //             ),
                        //           ),
                        //           suffix: GestureDetector(
                        //             onTap: () {
                        //               yearsController.clear();
                        //             },
                        //             child: SvgPicture.asset(
                        //               'assets/svg/cross_1.svg',
                        //               width: 12,
                        //               color: color_rgb,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       border: Border.all(color: color_rgb, width: 0.6)),
                        //   child: DropDownField(
                        //     onValueChanged: (dynamic value) {
                        //       gender_ID = value;
                        //     },
                        //     strict: false,
                        //     controller: daysController,
                        //     value: gender_ID,
                        //     required: false,
                        //     labelText: '-- ធ្វើការជ្រើសយក --',
                        //     labelStyle:
                        //         TextStyle(color: color_rgb, fontFamily: 'DG'),
                        //     items: country,
                        //     textStyle:
                        //         TextStyle(color: color_rgb, fontFamily: 'DG'),
                        //   ),
                        // ),
                        // Divider(
                        //     height: 10.0,
                        //     color: Theme.of(context).primaryColor),

                        TypeAheadFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          suggestionsCallback: (pattern) => gender_list.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) => ListTile(
                            title: Text(
                              item,
                              style:
                                  TextStyle(fontFamily: 'DG', color: color_rgb),
                            ),
                          ),
                          onSuggestionSelected: (String val) {
                            this.daysController.text = val;
                            print(val);
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'គ្នានក្នុងបញ្ជី',
                              style:
                                  TextStyle(color: color_rgb, fontFamily: 'DG'),
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            style:
                                TextStyle(color: color_rgb, fontFamily: 'DG'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "--​ ធ្វើការជ្រើសយក --",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontFamily: "DG"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                  width: 0.8,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  daysController.clear();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/cross_1.svg',
                                  width: 12,
                                  color: red,
                                ),
                              ),
                            ),
                            controller: this.daysController,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'ជនជាតិ ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///
                        SizedBox(
                          height: 7,
                        ),
                        TypeAheadFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          suggestionsCallback: (pattern) => country_list.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) => ListTile(
                            title: Text(
                              item,
                              style:
                                  TextStyle(fontFamily: 'DG', color: color_rgb),
                            ),
                          ),
                          onSuggestionSelected: (String val) {
                            this.monthsController.text = val;
                            print(val);
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'គ្នានក្នុងបញ្ជី',
                              style:
                                  TextStyle(color: color_rgb, fontFamily: 'DG'),
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            style:
                                TextStyle(color: color_rgb, fontFamily: 'DG'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "--​ ធ្វើការជ្រើសយក --",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontFamily: "DG"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                  width: 0.8,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  monthsController.clear();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/cross_1.svg',
                                  width: 12,
                                  color: red,
                                ),
                              ),
                            ),
                            controller: this.monthsController,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'រាជធានី ខេត្ដកំណើត ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///
                        SizedBox(
                          height: 7,
                        ),
                        TypeAheadFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          suggestionsCallback: (pattern) => village_list.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) => ListTile(
                            title: Text(
                              item,
                              style:
                                  TextStyle(fontFamily: 'DG', color: color_rgb),
                            ),
                          ),
                          onSuggestionSelected: (String val) {
                            this.villageController.text = val;
                            print(val);
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'គ្នានក្នុងបញ្ជី',
                              style:
                                  TextStyle(color: color_rgb, fontFamily: 'DG'),
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            style:
                                TextStyle(color: color_rgb, fontFamily: 'DG'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "--​ ធ្វើការជ្រើសយក --",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontFamily: "DG"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                  width: 0.8,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  villageController.clear();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/cross_1.svg',
                                  width: 12,
                                  color: red,
                                ),
                              ),
                            ),
                            controller: this.villageController,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'ថ្ងៃខែឆ្នាំកំណើត ៖',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: databController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));

                            if (pickeddate != null) {
                              setState(() {
                                databController.text =
                                    DateFormat('dd-MM-yyyy').format(pickeddate);
                              });
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: color_rgb,
                            fontFamily: 'DG',
                          ),
                          cursorColor: color_rgb,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "--​ ធ្វើការជ្រើសយក --",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontFamily: "DG"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                                width: 0.8,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                databController.clear();
                              },
                              child: SvgPicture.asset(
                                'assets/svg/cross_1.svg',
                                width: 12,
                                color: red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'ឈ្មោះជាភាសាអង់គ្លេរ​ A-Z (អក្សរធំ) (UPPERCASE) ៖',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: engnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill';
                            }
                          },
                          style: TextStyle(
                              color: color_rgb,
                              fontFamily: 'DG',
                              fontWeight: FontWeight.bold),
                          cursorColor: color_rgb,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("^[\u0000-\u007F]+\$")),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "ENGLISH NAME",
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "DG",
                                fontWeight: FontWeight.bold),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                                width: 0.8,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                engnameController.clear();
                              },
                              child: SvgPicture.asset(
                                'assets/svg/cross_1.svg',
                                width: 12,
                                color: red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'លេខទូរស័ព្ទ​ ៖',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: color_rgb,
                            fontFamily: 'DG',
                          ),
                          cursorColor: color_rgb,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "លេខទូរស័ព្ទ",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontFamily: "DG"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                                width: 0.8,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                phoneController.clear();
                              },
                              child: SvgPicture.asset(
                                'assets/svg/cross_1.svg',
                                width: 12,
                                color: red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'កម្រិតសិក្សាពេលបច្ចុប្បន្ន ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///
                        SizedBox(
                          height: 7,
                        ),
                        TypeAheadFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          suggestionsCallback: (pattern) => grend_list.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) => ListTile(
                            title: Text(
                              item,
                              style:
                                  TextStyle(fontFamily: 'DG', color: color_rgb),
                            ),
                          ),
                          onSuggestionSelected: (String val) {
                            this.yearsController.text = val;
                            print(val);
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'គ្នានក្នុងបញ្ជី',
                              style:
                                  TextStyle(color: color_rgb, fontFamily: 'DG'),
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            style:
                                TextStyle(color: color_rgb, fontFamily: 'DG'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "--​ ធ្វើការជ្រើសយក --",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontFamily: "DG"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                  width: 0.8,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  yearsController.clear();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/cross_1.svg',
                                  width: 12,
                                  color: red,
                                ),
                              ),
                            ),
                            controller: this.yearsController,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'កម្រិតសិក្សាស្នើរសុំដាក់ពាក្យ ៖',
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///
                        SizedBox(
                          height: 7,
                        ),
                        TypeAheadFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          suggestionsCallback: (pattern) => finish_list.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) => ListTile(
                            title: Text(
                              item,
                              style:
                                  TextStyle(fontFamily: 'DG', color: color_rgb),
                            ),
                          ),
                          onSuggestionSelected: (String val) {
                            this.finishController.text = val;
                            print(val);
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'គ្នានក្នុងបញ្ជី',
                              style:
                                  TextStyle(color: color_rgb, fontFamily: 'DG'),
                            ),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            style:
                                TextStyle(color: color_rgb, fontFamily: 'DG'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "--​ ធ្វើការជ្រើសយក --",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontFamily: "DG"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: color_rgb,
                                  width: 0.8,
                                ),
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  finishController.clear();
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/cross_1.svg',
                                  width: 12,
                                  color: red,
                                ),
                              ),
                            ),
                            controller: this.finishController,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style:
                                      TextStyle(color: red, fontFamily: 'DG'),
                                ),
                                Text(
                                  'អាសយដ្ឋានបច្ចុប្បន្ន ៖',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: color_rgb, fontFamily: 'DG'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill it';
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          style: TextStyle(
                            color: color_rgb,
                            fontFamily: 'DG',
                          ),
                          cursorColor: color_rgb,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "អាសយដ្ឋាន",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontFamily: "DG"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: color_rgb,
                                width: 0.8,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                addressController.clear();
                              },
                              child: SvgPicture.asset(
                                'assets/svg/cross_1.svg',
                                width: 12,
                                color: red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        ///

                        SizedBox(
                          height: 15,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: color_rgb,
                            side: BorderSide(color: color_rgb, width: 0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          onPressed: () {
                            final isValid = formKey.currentState!.validate();
                            if (isValid) {
                              formKey.currentState!.save();
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: double.infinity,
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '- សូមធ្វើការត្រួពិនិន្ដម្ដងទៀនមុនធ្វើការយល់ព្រម :',
                                            style: TextStyle(
                                                color: color_rgb,
                                                fontFamily: 'DG',
                                                fontSize: 18),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ឈ្មោះ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                    ),
                                                    Text(
                                                      ' ៖​ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          firstnameController
                                                              .text,
                                                          style: TextStyle(
                                                              color: color_rgb,
                                                              fontFamily: 'DG',
                                                              fontSize: 17),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(' '),
                                                        Container(
                                                          width: 100,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  lastnameController
                                                                      .text,
                                                                  style: TextStyle(
                                                                      color:
                                                                          color_rgb,
                                                                      fontFamily:
                                                                          'DG',
                                                                      fontSize:
                                                                          17),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ភេទ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 63,
                                                    ),
                                                    Text(
                                                      ' ៖​​ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      daysController.text,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ជនជាតិ ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 39,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      monthsController.text,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'រាជធានី ខេត្ដ ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Container(
                                                      width: 170,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              villageController
                                                                  .text,
                                                              style: TextStyle(
                                                                  color:
                                                                      color_rgb,
                                                                  fontFamily:
                                                                      'DG',
                                                                  fontSize: 17),
                                                              // overflow:
                                                              //     TextOverflow
                                                              //         .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ថ្ងៃខែឆ្នាំកំណើត',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 0,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      databController.text,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ENG NAME ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 0,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Container(
                                                      width: 170,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              engnameController
                                                                  .text,
                                                              style: TextStyle(
                                                                  color:
                                                                      color_rgb,
                                                                  fontFamily:
                                                                      'DG',
                                                                  fontSize: 17),
                                                              // overflow:
                                                              //     TextOverflow
                                                              //         .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'លេខទូរស័ព្ទ ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Container(
                                                      width: 170,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              phoneController
                                                                  .text,
                                                              style: TextStyle(
                                                                  color:
                                                                      color_rgb,
                                                                  fontFamily:
                                                                      'DG',
                                                                  fontSize: 17),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ក.ស បច្ចុប្បន្ន',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      yearsController.text,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ក.ស ស្នើរសុំ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 13,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      finishController.text,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, left: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'អាសីដ្ឋាន ',
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    SizedBox(
                                                      width: 27,
                                                    ),
                                                    Text(
                                                      '​ ៖ ',
                                                      style: TextStyle(
                                                          color: red,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                    Container(
                                                      width: 170,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              addressController
                                                                  .text,
                                                              style: TextStyle(
                                                                  color:
                                                                      color_rgb,
                                                                  fontFamily:
                                                                      'DG',
                                                                  fontSize: 15),
                                                              // overflow:
                                                              //     TextOverflow
                                                              //         .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 25),
                                            child: OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                // onSurface: Colors.white,
                                                backgroundColor: color_rgb,
                                                minimumSize:
                                                    Size(double.infinity, 56),
                                                shadowColor: Colors.blue[800],
                                                side: BorderSide(
                                                    color: color_rgb,
                                                    width: 0.3),
                                                shape:
                                                    const BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0.3))),
                                                elevation: 0,
                                              ),
                                              onPressed: () async {
                                                final isValid = formKey
                                                    .currentState!
                                                    .validate();
                                                if (isValid) {
                                                  formKey.currentState!.save();
                                                  final feedback = {
                                                    SheetsColumn.f_name:
                                                        firstnameController.text
                                                            .trim(),
                                                    SheetsColumn.l_name:
                                                        lastnameController.text
                                                            .trim(),
                                                    SheetsColumn.eng_name:
                                                        engnameController.text
                                                            .trim(),
                                                    SheetsColumn.phones:
                                                        phoneController.text
                                                            .trim(),
                                                    SheetsColumn.days:
                                                        daysController.text
                                                            .trim(),
                                                    SheetsColumn.months:
                                                        monthsController.text
                                                            .trim(),
                                                    SheetsColumn.years:
                                                        yearsController.text
                                                            .trim(),
                                                    SheetsColumn.finishs:
                                                        finishController.text
                                                            .trim(),
                                                    SheetsColumn.datab:
                                                        databController.text
                                                            .trim(),
                                                    SheetsColumn.village:
                                                        villageController.text
                                                            .trim(),
                                                    SheetsColumn.address:
                                                        addressController.text
                                                            .trim(),
                                                  };

                                                  firstnameController.clear();
                                                  lastnameController.clear();
                                                  engnameController.clear();
                                                  phoneController.clear();
                                                  daysController.clear();
                                                  monthsController.clear();
                                                  yearsController.clear();
                                                  finishController.clear();
                                                  databController.clear();
                                                  villageController.clear();
                                                  addressController.clear();

                                                  await SheetsFlutter.insert(
                                                      [feedback]);

                                                  Navigator.pop(context);

                                                  final text =
                                                      'ការចុះឈ្មោះអ្នកប្រកបដោយជោកជ័យ.. អរគុណ!';
                                                  final snackBar = SnackBar(
                                                    backgroundColor: color_rgb,
                                                    content: Text(
                                                      text,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'DG'),
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              },
                                              icon: Icon(
                                                Icons.app_registration,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                'ធ្វើការចុះឈ្មោះ',
                                                style: TextStyle(
                                                    fontFamily: 'DG',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            height: 68,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/book-open-cover.svg',
                                      width: 16,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'ចុះឈ្មោះសិក្សា',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'DG',
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> gender = [
  "MALE",
  "FEMALE",
  "OTHER",
];

class GenderPicker extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  static const gender_list = [
    "MALE",
    "FEMALE",
    "OTHER",
  ];

  @override
  Widget build(BuildContext context) {
    final dw = MediaQuery.of(context).size.width / 100;
    final dh = MediaQuery.of(context).size.width / 100;
    return Container(
      height: dh * 60,
      padding: EdgeInsets.symmetric(horizontal: dw * 4, vertical: dw * 4),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        Text("data"),
        Form(
          key: _formKey,
          child: Container(
            height: dh * 7,
            margin: EdgeInsets.symmetric(vertical: dh * 1),
            child: TypeAheadFormField(
              suggestionsCallback: (pattern) => gender_list.where(
                  (item) => item.toLowerCase().contains(pattern.toLowerCase())),
              itemBuilder: (_, String item) => ListTile(
                title: Text(item),
              ),
              onSuggestionSelected: (String val) {
                this._textEditingController.text = val;
                print(val);
              },
              getImmediateSuggestions: true,
              hideSuggestionsOnKeyboardHide: false,
              hideOnEmpty: false,
              noItemsFoundBuilder: (context) => Padding(
                padding: EdgeInsets.all(8),
                child: Text('NO ITEM FOUND'),
              ),
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  hintText: 'Type your text here......',
                  border: OutlineInputBorder(),
                ),
                controller: this._textEditingController,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
