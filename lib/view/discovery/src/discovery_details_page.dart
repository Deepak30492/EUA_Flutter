import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/src/healthcare_types.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/controller/discovery/src/get_discovery_details_controller.dart';
import 'package:uhi_eua_flutter_app/model/src/healthcare_service_provider_name.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/utils/src/loading_indicator.dart';
import 'package:uhi_eua_flutter_app/view/fulfillments/fulfillments.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class DiscoveryDetailsPage extends StatefulWidget {
  String healthcareType;
  String searchHealthcareQuery;
  String searchSymptomsQuery;

  DiscoveryDetailsPage({
    Key? key,
    required this.healthcareType,
    required this.searchHealthcareQuery,
    required this.searchSymptomsQuery,
  }) : super(key: key);

  @override
  State<DiscoveryDetailsPage> createState() => _DiscoveryDetailsPageState();
}

class _DiscoveryDetailsPageState extends State<DiscoveryDetailsPage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///CONTROLLERS
  TextEditingController _healthcareTextEditingController =
      TextEditingController();
  TextEditingController _symptomsTextEditingController =
      TextEditingController();
  PostDiscoveryDetailsController _postDiscoveryDetailsController =
      Get.put(PostDiscoveryDetailsController());
  GetDiscoveryDetailsController _getDiscoveryDetailsController =
      Get.put(GetDiscoveryDetailsController());

  ///DATA VARIABLES
  String _dropdownValue = HealthcareTypes.serviceProviderName;
  final List<String> _listOfDropdownValues = [
    HealthcareTypes.serviceProviderName,
    HealthcareTypes.professionalName,
    // HealthcareTypes.serviceName,
  ];
  bool isShowLocationDialog = false;
  String? _uniqueId;
  AcknowledgementModel? _acknowledgementModel;
  StreamSubscription? _streamSubscription;
  // StreamController _streamController = StreamController.broadcast();
  List<ResponseModel>? _listOfResponseModel;
  List<DiscoveryDetailsModel>? _listOfDiscoveryDetailsModel =
      List<DiscoveryDetailsModel>.empty(growable: true);
  List<Fulfillments>? _listOfFulfillments =
      List<Fulfillments>.empty(growable: true);
  FocusNode _focusNode = FocusNode();
  String? _hospitalName;
  String? _categoryName;
  bool isShowLoadingIndicator = false;
  String? _providerId;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.healthcareType;
    _healthcareTextEditingController.text = widget.searchHealthcareQuery;
    _symptomsTextEditingController.text = widget.searchSymptomsQuery;
    // _streamController.addStream(_getSearchDetails());
    // _streamSubscription = _getSearchDetails().listen(
    //   (event) {},
    // );
    callAPIs();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    // _streamController.close();
    _healthcareTextEditingController.dispose();
    super.dispose();
  }

  callAPIs() async {
    // _postDiscoveryDetailsController.refresh();
    // _getDiscoveryDetailsController.refresh();
    clearAll();

    setState(() {
      isShowLoadingIndicator = true;
    });
    _acknowledgementModel = await _postDiscoveryDetails(
        searchQuery: widget.searchHealthcareQuery,
        searchType: widget.healthcareType);

    if (_acknowledgementModel == null ||
        _acknowledgementModel?.message?.ack == null) {
      setState(() {
        isShowLoadingIndicator = false;
      });
    }

    if (_acknowledgementModel?.message?.ack?.status == "ACK") {
      Timer.periodic(const Duration(milliseconds: 500), (timer) async {
        if (_getDiscoveryDetailsController.discoveryDetails != null) {
          _uniqueId = null;
          setState(() {
            isShowLoadingIndicator = false;
          });
          timer.cancel();
        } else if (_getDiscoveryDetailsController.errorString.isNotEmpty) {
          setState(() {
            isShowLoadingIndicator = false;
          });
          timer.cancel();
        } else if (_getDiscoveryDetailsController.discoveryDetails == null) {
          await _getDiscoveryDetailsController.getDiscoveryDetails(
              messageId: _uniqueId, getUrlType: "search");
        }
      });
    }
  }

  Future<AcknowledgementModel?> _postDiscoveryDetails(
      {required String searchType, required String searchQuery}) async {
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

    if (_dropdownValue == HealthcareTypes.serviceProviderName) {
      HealthcareServiceProviderName serviceProviderNameRequestModel =
          HealthcareServiceProviderName();
      HealthcareServiceProviderNameMessage message =
          HealthcareServiceProviderNameMessage();
      HealthcareServiceProviderMessageIntent intent =
          HealthcareServiceProviderMessageIntent();
      HealthcareServiceProviderMessageDescriptor descriptor =
          HealthcareServiceProviderMessageDescriptor();
      HealthcareServiceProviderMessageProvider provider =
          HealthcareServiceProviderMessageProvider();
      serviceProviderNameRequestModel.context = contextModel;
      descriptor.name = _healthcareTextEditingController.text;
      provider.descriptor = descriptor;
      intent.provider = provider;
      message.intent = intent;
      serviceProviderNameRequestModel.message = message;
      print("==> ${jsonEncode(serviceProviderNameRequestModel)}");
      await _postDiscoveryDetailsController.postDiscoveryDetails(
          discoveryDetails: serviceProviderNameRequestModel,
          discoveryType: HealthcareTypes.serviceProviderName);
    } else if (_dropdownValue == HealthcareTypes.serviceName) {
      HealthcareServiceNameRequestModel serviceNameRequestModel =
          HealthcareServiceNameRequestModel();
      HealthcareServiceNameMessage message = HealthcareServiceNameMessage();
      HealthcareServiceNameItem item = HealthcareServiceNameItem();
      HealthcareServiceNameIntent intent = HealthcareServiceNameIntent();
      HealthcareServiceNameDescriptor descriptor =
          HealthcareServiceNameDescriptor();
      serviceNameRequestModel.context = contextModel;
      descriptor.name = _healthcareTextEditingController.text;
      item.descriptor = descriptor;
      intent.item = item;
      message.intent = intent;
      serviceNameRequestModel.message = message;
      print("==> ${jsonEncode(serviceNameRequestModel)}");
      await _postDiscoveryDetailsController.postDiscoveryDetails(
          discoveryDetails: serviceNameRequestModel,
          discoveryType: HealthcareTypes.serviceName);
    } else if (_dropdownValue == HealthcareTypes.professionalName) {
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
      descriptor.name = _healthcareTextEditingController.text;
      person.descriptor = descriptor;
      fulfillment.person = person;
      intent.fulfillment = fulfillment;
      message.intent = intent;
      professionalNameRequestModel.message = message;
      print("==> ${jsonEncode(professionalNameRequestModel)}");

      await _postDiscoveryDetailsController.postDiscoveryDetails(
          discoveryDetails: professionalNameRequestModel,
          discoveryType: HealthcareTypes.professionalName);
    }

    return _postDiscoveryDetailsController.discoveryAckDetails;
  }

  // Stream _getSearchDetails() => Stream.periodic(
  //       const Duration(milliseconds: 500),
  //       (computationCount) async {
  //         if (_acknowledgementModel?.message?.ack?.status == "ACK") {
  //           if (_getDiscoveryDetailsController.discoveryDetails != null) {
  //             _uniqueId = null;
  //             _streamSubscription?.cancel();
  //             return;
  //           } else if (_getDiscoveryDetailsController.errorString.isNotEmpty) {
  //             _streamSubscription?.cancel();
  //             return;
  //           } else if (_getDiscoveryDetailsController.discoveryDetails ==
  //               null) {
  //             await _getDiscoveryDetailsController.getDiscoveryDetails(
  //                 messageId: _uniqueId, getUrlType: "search");
  //           }
  //         }
  //       },
  //     );

  @override
  Widget build(BuildContext context) {
    ///ASSIGNING VALUES
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: AppColors.darkGrey323232,
            size: 32,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        titleSpacing: 0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.place_outlined,
                color: AppColors.primaryLightBlue007BFF,
                size: 28,
              ),
              Spacing(),
              InkWell(
                onTap: () {
                  setState(() {
                    isShowLocationDialog = !isShowLocationDialog;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Location",
                      style: AppTextStyle.subHeading5TextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pune, Maharashtra",
                          style: AppTextStyle.normal1TextStyle,
                        ),
                        Spacing(),
                        Icon(
                          Icons.expand_more,
                          color: AppColors.primaryLightBlue007BFF,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: buildWidgets(),

      // body: StreamBuilder(
      //     stream: _getSearchDetails(),
      //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.none:
      //           return Container(
      //             child: Center(
      //               child: Text(
      //                 "Something went wrong",
      //                 style: AppTextStyle.subHeading1TextStyle,
      //               ),
      //             ),
      //           );

      //         case ConnectionState.waiting:
      //           return CommonLoadingIndicator();

      //         case ConnectionState.active:
      //           return _getDiscoveryDetailsController.discoveryDetails != null
      //               ? buildWidgets()
      //               : CommonLoadingIndicator();

      //         case ConnectionState.done:
      //           return buildWidgets();
      //       }
      //     }),
    );
  }

  buildWidgets() {
    return Container(
      width: width,
      height: height,
      color: AppColors.backgroundWhiteColorFBFCFF,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing(isWidth: false),
            Container(
              width: width * 0.94,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Center(
                        child: DropdownButton<String>(
                      value: _dropdownValue,
                      icon: Icon(
                        Icons.expand_more_rounded,
                        color: AppColors.primaryLightBlue007BFF,
                        size: 24,
                      ),
                      style: AppTextStyle.textFieldTextStyle,
                      isExpanded: true,
                      underline: Container(),
                      borderRadius: BorderRadius.circular(5),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                        });
                      },
                      items: _listOfDropdownValues
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                  ),
                  Container(
                    height: 3,
                    color: AppColors.primaryLightBlue007BFF,
                  ),
                ],
              ),
            ),
            Spacing(isWidth: false),
            Container(
              width: width * 0.94,
              child: Column(
                children: [
                  TextField(
                    controller: _healthcareTextEditingController,
                    focusNode: _focusNode,
                    style: AppTextStyle.textFieldTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search a professional, service etc.",
                      hintStyle: AppTextStyle.textFieldHintTextStyle,
                      contentPadding:
                          const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                      suffixIcon:
                          _healthcareTextEditingController.text.isNotEmpty
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _healthcareTextEditingController.clear();
                                      // _getDiscoveryDetailsController.refresh();
                                      // _postDiscoveryDetailsController.refresh();
                                      // _listOfResponseModel?.clear();
                                      // _listOfDiscoveryDetailsModel?.clear();
                                      // _listOfFulfillments?.clear();
                                      clearAll();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: AppColors.darkGrey323232,
                                      size: 20,
                                    ),
                                  ),
                                )
                              : null,
                    ),
                    onEditingComplete: () {
                      if (_healthcareTextEditingController.text.isNotEmpty) {
                        callAPIs();
                        _focusNode.unfocus();
                      }
                    },
                  ),
                  Container(
                    height: 3,
                    color: AppColors.primaryLightBlue007BFF,
                  ),
                ],
              ),
            ),
            Spacing(isWidth: false),
            Container(
              width: width * 0.94,
              child: Column(
                children: [
                  TextField(
                    controller: _symptomsTextEditingController,
                    style: AppTextStyle.textFieldTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tell us your symptoms",
                      hintStyle: AppTextStyle.textFieldHintTextStyle,
                      contentPadding:
                          const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                      suffixIcon: _symptomsTextEditingController.text.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  _symptomsTextEditingController.clear();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: AppColors.darkGrey323232,
                                  size: 20,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                  Container(
                    height: 3,
                    color: AppColors.primaryLightBlue007BFF,
                  ),
                ],
              ),
            ),
            Spacing(isWidth: false),
            isShowLoadingIndicator
                ? const CommonLoadingIndicator()
                : _postDiscoveryDetailsController.errorString.isNotEmpty ||
                        _getDiscoveryDetailsController.errorString.isNotEmpty ||
                        _acknowledgementModel == null ||
                        _acknowledgementModel?.message?.ack == null
                    ? Container(
                        height: height * 0.08,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Some error occurred ",
                                style: AppTextStyle.subHeading4DarkTextStyle,
                              ),
                              Icon(
                                Icons.error_outline_rounded,
                                size: 20,
                                color: AppColors.darkGrey323232,
                              )
                            ],
                          ),
                        ),
                      )
                    : buildDoctorsList(),
          ],
        ),
      ),
    );
  }

  buildDoctorsList() {
    if (_getDiscoveryDetailsController.discoveryDetails != null &&
        _listOfFulfillments!.isEmpty) {
      _listOfResponseModel = _getDiscoveryDetailsController.discoveryDetails;

      // _discoveryDetailsModel = DiscoveryDetailsModel.fromJson(
      //     jsonDecode(_responseModel!.response!) as Map<String, dynamic>);
      // _listOfFulfillments =
      //     _discoveryDetailsModel?.message?.catalog?.providers?[0].fulfillments;
      // _hospitalName =
      //     "${_discoveryDetailsModel?.message?.catalog?.providers?[0].descriptor?.name} ";
      // _categoryName = _discoveryDetailsModel
      //     ?.message?.catalog?.providers?[0].categories?[0].descriptor?.name;
      // log("==> ${jsonEncode(_discoveryDetailsModel)}");

      _listOfResponseModel?.forEach((element) {
        _listOfDiscoveryDetailsModel?.add(DiscoveryDetailsModel.fromJson(
            jsonDecode(element.response!) as Map<String, dynamic>));
      });

      // log("==> ${jsonEncode(_listOfDiscoveryDetailsModel)}");

      _listOfDiscoveryDetailsModel?.forEach(
        (element) {
          if (element.message != null) {
            _hospitalName =
                "${element.message?.catalog?.providers?[0].descriptor?.name} ";
            _providerId = "${element.message?.catalog?.providers?[0].id} ";

            element.message?.catalog?.providers?[0].fulfillments
                ?.forEach((element) {
              _listOfFulfillments?.add(element);
            });
          }
        },
      );
    }

    return Column(
      children: [
        Container(
          width: width * 0.94,
          child: Text(
            "${_listOfFulfillments?.length}" +
                (_listOfFulfillments != null && _listOfFulfillments!.length <= 1
                    ? " result found"
                    : " results found"),
            style: AppTextStyle.textFieldHintTextStyle,
          ),
        ),
        Spacing(isWidth: false),
        Container(
          width: width * 0.94,
          height: height,
          child: ListView.builder(
            // itemCount: 5,
            itemCount: _listOfFulfillments?.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildDoctorTile(_listOfFulfillments![index]);
            },
          ),
        ),
      ],
    );
  }

  buildDoctorTile(Fulfillments fulfillment) {
    String? doctorName = fulfillment.person?.name ?? "";
    String? gender = fulfillment.person?.gender;
    String? tags = fulfillment.tags?.speciality;
    doctorName = doctorName + ", " + (tags ?? "Orthopedic Surgeon");
    String? doctorId = fulfillment.id;

    return InkWell(
      onTap: () async {
        final result = await Get.to(() => FulfillmentDetailsPage(
              fulfillmentName: doctorName ?? "",
              fulfillmentHospital: _hospitalName ?? "",
              fulfillmentImageUrl: fulfillment.person!.image!,
              fulfillmentId: doctorId ?? "",
              fulfillmentProviderId: _providerId ?? "",
            ));
      },
      child: Container(
        height: height * 0.16,
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: AppShadows.shadow1,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: fulfillment.person!.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: width * 0.3,
                  height: height * 0.16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fulfillment.person!.image!.contains("https")
                          ? imageProvider
                          : Image.file(File(fulfillment.person!.image!)).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Center(
                  child: Container(
                width: width * 0.3,
                height: height * 0.16,
                child: Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.secondaryOrangeFF8A07,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryLightBlue007BFF,
                        ),
                      )),
                ),
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        // "Dr. Neesheet Parikh, DO",
                        doctorName,
                        style: AppTextStyle.doctorNameSmallTextStyle,
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          // text: "Max Hospital, Skin Specialist, ",
                          text: _hospitalName ?? "",
                          style: AppTextStyle.hospitalNameSmallTextStyle,
                          children: [
                            TextSpan(
                              text: "1.2 km away",
                              style:
                                  AppTextStyle.locationDistanceSmallTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      child: Text(
                        "Available Time",
                        style: AppTextStyle.verySmallHeadingTextStyle,
                      ),
                    ),
                    Container(
                      child: Text(
                        "09:00 AM to 05:00 PM",
                        style: AppTextStyle.timeTextStyle,
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "₹ 500",
                              style: AppTextStyle.priceTextStyle,
                            ),
                          ),
                          Container(
                            child: Text(
                              "View",
                              style: AppTextStyle.textButtonTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clearAll() {
    _getDiscoveryDetailsController.refresh();
    _postDiscoveryDetailsController.refresh();
    _listOfResponseModel?.clear();
    _listOfDiscoveryDetailsModel?.clear();
    _listOfFulfillments?.clear();
  }
}
