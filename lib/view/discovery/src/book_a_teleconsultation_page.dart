import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/view.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class BookATeleconsultationPage extends StatefulWidget {
  const BookATeleconsultationPage({Key? key}) : super(key: key);

  @override
  State<BookATeleconsultationPage> createState() =>
      _BookATeleconsultationPageState();
}

class _BookATeleconsultationPageState extends State<BookATeleconsultationPage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///CONTROLLERS
  final _doctorNameOrIdTextEditingController = TextEditingController();
  final _hospitalOrClinicTextEditingController = TextEditingController();
  final _postDiscoveryDetailsController =
      Get.put(PostDiscoveryDetailsController());

  ///DATA VARIABLES
  String _specialitiesDropdownValue = "";
  final List<String> _listOfSpecialitiesDropdownValue = [
    "Physician",
    "Orthopedist",
    "Psychiatrist",
  ];

  String _systemOfMedDropdownValue = "";
  final List<String> _listOfSystemOfMedDropdownValue = [
    "Internal",
    "External",
  ];

  String _languageDropdownValue = "";
  final List<String> _listOfLanguageDropdownValue = [
    "English",
    "Hindi",
    "Marathi",
  ];

  String _cityDropdownValue = "";
  final List<String> _listOfCityDropdownValue = [
    "Pune",
    "Mumbai",
  ];

  bool isToday = false;
  bool isThisWeek = false;
  bool isThisMonth = false;

  String _uniqueId = "";

  @override
  Widget build(BuildContext context) {
    ///ASSIGNING VALUES
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          size: 25,
          color: Colors.black,
        ),
        title: Container(
          child: Text(
            "Book a Teleconsultation",
            style: AppTextStyle.appbarTitleTextStyle,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing(size: 30, isWidth: false),
            Center(
              child: Container(
                width: width * 0.86,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 15,
                      color: Color(0x1B1C204D),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How do teleconsultations work?",
                      style: AppTextStyle.subHeading4LightTextStyle,
                    ),
                    Spacing(size: 15, isWidth: false),
                    Row(
                      children: [
                        Text(
                          "Search\nDoctor",
                          style: AppTextStyle.subHeading4MediumTextStyle,
                        ),
                        Spacing(size: 20),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: Color(0xFF324755),
                        ),
                        Spacing(size: 20),
                        Text(
                          "Complete\nPayment",
                          style: AppTextStyle.subHeading4MediumTextStyle,
                        ),
                        Spacing(size: 20),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22,
                          color: Color(0xFF324755),
                        ),
                        Spacing(size: 20),
                        Text(
                          "Start\nConsultation",
                          style: AppTextStyle.subHeading4MediumTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacing(size: 30, isWidth: false),
            Container(
              width: width * 0.86,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find your doctor / health care provider",
                    style: AppTextStyle.heading4TextStyle,
                  ),
                  Spacing(size: 30, isWidth: false),
                  TextFormField(
                    controller: _doctorNameOrIdTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Doctors Name/HPID",
                      hintStyle: AppTextStyle.textFieldHint2TextStyle,
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                  Spacing(size: 20, isWidth: false),
                  DropdownButtonFormField<String>(
                    // value: _specialitiesDropdownValue,
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      color: Color(0xFFC4C4C4),
                      size: 24,
                    ),
                    style: AppTextStyle.textFieldHint2TextStyle,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _specialitiesDropdownValue = newValue!;
                      });
                    },
                    hint: Text(
                      "Speciality",
                      style: AppTextStyle.textFieldHint2TextStyle,
                    ),
                    items: _listOfSpecialitiesDropdownValue
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Spacing(size: 20, isWidth: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          // value: _systemOfMedDropdownValue,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            color: Color(0xFFC4C4C4),
                            size: 24,
                          ),
                          style: AppTextStyle.textFieldHint2TextStyle,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _systemOfMedDropdownValue = newValue!;
                            });
                          },
                          hint: Text(
                            "System of medicine",
                            style: AppTextStyle.textFieldHint2TextStyle,
                          ),
                          items: _listOfSystemOfMedDropdownValue
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Spacing(size: 20),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          // value: _languageDropdownValue,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            color: Color(0xFFC4C4C4),
                            size: 24,
                          ),
                          style: AppTextStyle.textFieldHint2TextStyle,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _languageDropdownValue = newValue!;
                            });
                          },
                          hint: Text(
                            "Language spoken",
                            style: AppTextStyle.textFieldHint2TextStyle,
                          ),
                          items: _listOfLanguageDropdownValue
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Spacing(size: 20, isWidth: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          // value: _cityDropdownValue,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            color: Color(0xFFC4C4C4),
                            size: 24,
                          ),
                          style: AppTextStyle.textFieldHint2TextStyle,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _cityDropdownValue = newValue!;
                            });
                          },
                          hint: Text(
                            "City",
                            style: AppTextStyle.textFieldHint2TextStyle,
                          ),
                          items: _listOfCityDropdownValue
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Spacing(size: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _hospitalOrClinicTextEditingController,
                          decoration: InputDecoration(
                            hintText: "Hospital/Clinic",
                            hintStyle: AppTextStyle.textFieldHint2TextStyle,
                            border: const UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacing(size: 30, isWidth: false),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Availability",
                          style: AppTextStyle.textFieldHint2TextStyle,
                        ),
                        Spacing(isWidth: false),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isToday = !isToday;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                  color: isToday
                                      ? const Color(0xFF264488)
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF264488),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Today",
                                  style: isToday
                                      ? AppTextStyle
                                          .textFieldHint2WhiteTextStyle
                                      : AppTextStyle
                                          .textFieldHint2BlueTextStyle,
                                ),
                              ),
                            ),
                            Spacing(size: 6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isThisWeek = !isThisWeek;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                  color: isThisWeek
                                      ? const Color(0xFF264488)
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF264488),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "This Week",
                                  style: isThisWeek
                                      ? AppTextStyle
                                          .textFieldHint2WhiteTextStyle
                                      : AppTextStyle
                                          .textFieldHint2BlueTextStyle,
                                ),
                              ),
                            ),
                            Spacing(size: 6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isThisMonth = !isThisMonth;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                  color: isThisMonth
                                      ? const Color(0xFF264488)
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF264488),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "This Month",
                                  style: isThisMonth
                                      ? AppTextStyle
                                          .textFieldHint2WhiteTextStyle
                                      : AppTextStyle
                                          .textFieldHint2BlueTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacing(size: 20, isWidth: false),
            InkWell(
              onTap: () {
                // Get.to(() => DiscoveryResultsPage());
                callApis();
              },
              child: Container(
                width: width * 0.86,
                height: height * 0.06,
                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  color: Color(0xFFE8705A),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "FIND DOCTOR",
                    style: AppTextStyle.buttonOrangeTextStyle,
                  ),
                ),
              ),
            ),
            Spacing(size: 30, isWidth: false),
            InkWell(
              onTap: () {
                Get.to(() => AppointmentHistoryPage());
              },
              child: Container(
                width: width * 0.76,
                height: height * 0.06,
                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFF264488),
                    )),
                child: Center(
                  child: Text(
                    "View appointment history",
                    style: AppTextStyle.buttonBlueTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callApis() {
    if (_doctorNameOrIdTextEditingController.text.isEmpty) {
      log("Please enter doctor name or id");
    } else if (_doctorNameOrIdTextEditingController.text
            .contains(RegExp(r'[0-9]')) &&
        _specialitiesDropdownValue.isEmpty) {
      log("Doctor ID");
      createAckWithProfessionalId();
    } else if (_doctorNameOrIdTextEditingController.text
            .contains(RegExp(r'[a-zA-Z]')) &&
        _specialitiesDropdownValue.isEmpty) {
      log("Doctor Name");
      createAckWithProfessionalName();
    }

    if (_doctorNameOrIdTextEditingController.text
            .contains(RegExp(r'[a-zA-Z]')) &&
        _specialitiesDropdownValue.isNotEmpty) {
      log("doctor and speciality");
    }

    if (_specialitiesDropdownValue.isNotEmpty &&
        _languageDropdownValue.isNotEmpty) {
      log("speciality and language ${_languageDropdownValue}");
    }

    if (_systemOfMedDropdownValue.isNotEmpty &&
        _languageDropdownValue.isNotEmpty) {
      log("system of med and language");
    }

    if (_hospitalOrClinicTextEditingController.text.isEmpty) {
      log("Please enter hospital name");
    } else if (_hospitalOrClinicTextEditingController.text
        .contains(RegExp(r'[a-zA-Z]'))) {
      log("Doctor Name");
    }
  }

  createAckWithProfessionalId() async {
    _uniqueId = const Uuid().v1();

    ContextModel contextModel = ContextModel();
    contextModel.domain = "nic2004:85110";
    contextModel.country = "IND";
    contextModel.city = "std:080";
    contextModel.action = "search";
    contextModel.coreVersion = "0.7.1";
    // contextModel.messageId = "85a422c4-2867-4d72-b5f5-d31588e2f7c5";
    contextModel.messageId = _uniqueId;
    contextModel.consumerId = "refrenceapp.123";
    contextModel.consumerUri = "refrenceapp.123";
    contextModel.timestamp = DateTime.now().toLocal().toUtc().toIso8601String();

    HealthcareProfessionalIdRequestModel professionalIdRequestModel =
        HealthcareProfessionalIdRequestModel();
    HealthcareProfessionalIdMessage message = HealthcareProfessionalIdMessage();
    HealthcareProfessionalIdIntent intent = HealthcareProfessionalIdIntent();
    HealthcareProfessionalIdFulfillment fulfillment =
        HealthcareProfessionalIdFulfillment();
    HealthcareProfessionalIdPerson person = HealthcareProfessionalIdPerson();

    professionalIdRequestModel.context = contextModel;
    person.cred = _doctorNameOrIdTextEditingController.text;
    fulfillment.person = person;
    intent.fulfillment = fulfillment;
    message.intent = intent;
    professionalIdRequestModel.message = message;

    log("==> ${jsonEncode(professionalIdRequestModel)}");

    // await _postDiscoveryDetailsController.postDiscoveryDetails(
    //     discoveryDetails: professionalIdRequestModel);
  }

  createAckWithProfessionalName() async {
    _uniqueId = const Uuid().v1();

    ContextModel contextModel = ContextModel();
    contextModel.domain = "nic2004:85110";
    contextModel.country = "IND";
    contextModel.city = "std:080";
    contextModel.action = "search";
    contextModel.coreVersion = "0.7.1";
    // contextModel.messageId = "85a422c4-2867-4d72-b5f5-d31588e2f7c5";
    contextModel.messageId = _uniqueId;
    contextModel.consumerId = "refrenceapp.123";
    contextModel.consumerUri = "refrenceapp.123";
    contextModel.timestamp = DateTime.now().toLocal().toUtc().toIso8601String();

    HealthcareProfessionalNameRequestModel professionalNameRequestModel =
        HealthcareProfessionalNameRequestModel();
    HealthcareProfessionalNameMessage message =
        HealthcareProfessionalNameMessage();
    HealthcareProfessionalNameIntent intent =
        HealthcareProfessionalNameIntent();
    HealthcareProfessionalNameFulfillment fulfillment =
        HealthcareProfessionalNameFulfillment();
    HealthcareProfessionalNamePerson person =
        HealthcareProfessionalNamePerson();
    HealthcareProfessionalNameDescriptor descriptor =
        HealthcareProfessionalNameDescriptor();

    professionalNameRequestModel.context = contextModel;
    descriptor.name = _doctorNameOrIdTextEditingController.text;
    person.descriptor = descriptor;
    fulfillment.person = person;
    intent.fulfillment = fulfillment;
    message.intent = intent;
    professionalNameRequestModel.message = message;

    log("==> ${jsonEncode(professionalNameRequestModel)}");

    // await _postDiscoveryDetailsController.postDiscoveryDetails(
    //     discoveryDetails: professionalNameRequestModel);
  }
}
