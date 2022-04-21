import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/utils/src/loading_indicator.dart';
import 'package:uhi_eua_flutter_app/view/bookings/bookings.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uuid/uuid.dart';

class FulfillmentDetailsPage extends StatefulWidget {
  String fulfillmentName;
  String fulfillmentHospital;
  String fulfillmentImageUrl;
  String fulfillmentId;
  String fulfillmentProviderId;

  FulfillmentDetailsPage({
    Key? key,
    required this.fulfillmentName,
    required this.fulfillmentHospital,
    required this.fulfillmentImageUrl,
    required this.fulfillmentId,
    required this.fulfillmentProviderId,
  }) : super(key: key);

  @override
  State<FulfillmentDetailsPage> createState() => _FulfillmentDetailsPageState();
}

class _FulfillmentDetailsPageState extends State<FulfillmentDetailsPage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///CONTROLLERS
  PostFulfillmentDetailsController _postFulfillmentDetailsController =
      Get.put(PostFulfillmentDetailsController());
  GetFulfillmentDetailsController _getFulfillmentDetailsController =
      Get.put(GetFulfillmentDetailsController());

  ///DATA VARIABLES
  int? _selectedTimeSlotIndex;
  bool isShowDatePicker = false;
  bool isShowLoadingIndicator = false;
  String? _uniqueId;
  AcknowledgementModel? _acknowledgementModel;

  @override
  void initState() {
    super.initState();
    callAPIs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  callAPIs() async {
    // _postDiscoveryDetailsController.refresh();
    // _getDiscoveryDetailsController.refresh();

    setState(() {
      isShowLoadingIndicator = true;
    });
    _acknowledgementModel = await _postFulfillmentDetails(
      providerId: widget.fulfillmentProviderId,
      fulfillmenId: widget.fulfillmentId,
    );

    if (_acknowledgementModel == null ||
        _acknowledgementModel?.message?.ack == null) {
      setState(() {
        isShowLoadingIndicator = false;
      });
    }

    if (_acknowledgementModel?.message?.ack?.status == "ACK") {
      Timer.periodic(const Duration(milliseconds: 500), (timer) async {
        if (_getFulfillmentDetailsController.fulfillmentDetails != null) {
          _uniqueId = null;
          setState(() {
            isShowLoadingIndicator = false;
          });
          timer.cancel();
        } else if (_getFulfillmentDetailsController.errorString.isNotEmpty) {
          setState(() {
            isShowLoadingIndicator = false;
          });
          timer.cancel();
        } else if (_getFulfillmentDetailsController.fulfillmentDetails ==
            null) {
          await _getFulfillmentDetailsController.getFulfillmentDetails(
              messageId: _uniqueId, getUrlType: "search");
        }
      });
    }
  }

  Future<AcknowledgementModel?> _postFulfillmentDetails(
      {required String providerId, required String fulfillmenId}) async {
    _uniqueId = const Uuid().v1();

    ContextModel contextModel = ContextModel();
    contextModel.domain = "nic2004:85110";
    contextModel.country = "IND";
    contextModel.city = "std:080";
    contextModel.action = "select";
    contextModel.coreVersion = "0.7.1";
    // contextModel.messageId = "85a422c4-2867-4d72-b5f5-d31588e2f7c5";
    contextModel.messageId = _uniqueId;
    contextModel.timestamp = DateTime.now().toLocal().toUtc().toIso8601String();
    contextModel.consumerId = "112233";
    contextModel.consumerUri = "reference.app";

    FulfillmentDetailsRequestModel doctorDetailsRequestModel =
        FulfillmentDetailsRequestModel();
    FulfillmentDetailsRequestMessage message =
        FulfillmentDetailsRequestMessage();
    FulfillmentDetailsRequestOrder order = FulfillmentDetailsRequestOrder();
    FulfillmentDetailsRequestProvider provider =
        FulfillmentDetailsRequestProvider();
    FulfillmentDetailsRequestItems items = FulfillmentDetailsRequestItems();

    doctorDetailsRequestModel.context = contextModel;
    provider.id = providerId;
    items.id = providerId;
    items.fulfillmentId = fulfillmenId;
    order.items = [items];
    order.provider = provider;
    message.order = order;
    doctorDetailsRequestModel.message = message;

    log("==> ${jsonEncode(doctorDetailsRequestModel)}");

    await _postFulfillmentDetailsController.postFulfillmentDetails(
        fulfillmentDetails: doctorDetailsRequestModel);

    return _postFulfillmentDetailsController.fulfillmentAckDetails;
  }

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
        title: Text(
          // "Dr. Neesheet Parikh, DO",
          widget.fulfillmentName,
          style: AppTextStyle.doctorNameBigTextStyle,
        ),
        centerTitle: true,
        bottom: const AppbarBottomLine(),
      ),
      body: isShowLoadingIndicator
          ? const CommonLoadingIndicator()
          : builWidgets(),
      bottomSheet: BottomButtonWithFees(
        width: width,
        height: height,
        fees: "₹ 500",
        buttonName: "Book An Appointment",
        onButtonTap: () {
          Get.to(() => const BookingDetails());
        },
      ),
    );
  }

  builWidgets() {
    return Container(
      width: width,
      height: height,
      color: AppColors.backgroundWhiteColorFBFCFF,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FulfillmentImageAndLocation(
              width: width,
              imageUrl: widget.fulfillmentImageUrl,
              hospitalName: widget.fulfillmentHospital,
              distance: "",
            ),
            Container(
              width: width * 0.96,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Available Time",
                      style: AppTextStyle.subHeading4SemiBoldTextStyle,
                    ),
                  ),
                  Spacing(isWidth: false),
                  Container(
                    width: width * 0.96,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: AppShadows.shadow1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sunday, 14th April 2022",
                          style: AppTextStyle.infoSemiBoldTextStyle,
                        ),
                        InkWell(
                          onTap: () {
                            // setState(() {
                            //   isShowDatePicker = !isShowDatePicker;
                            // });
                          },
                          child: Icon(
                            Icons.calendar_today_rounded,
                            color: AppColors.primaryLightBlue007BFF,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacing(isWidth: false),
                  Stack(
                    children: [
                      Container(
                        height: height * 0.5,
                        child: GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedTimeSlotIndex = index;
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: _selectedTimeSlotIndex == index
                                          ? AppColors.primaryLightBlue007BFF
                                          : AppColors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: AppShadows.shadow2,
                                    ),
                                    child: Text(
                                      "08:30 AM To 09:30 AM",
                                      style: _selectedTimeSlotIndex == index
                                          ? AppTextStyle
                                              .infoWhiteSemiBoldTextStyle
                                          : AppTextStyle.infoSemiBoldTextStyle,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      isShowDatePicker
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 1,
                                color: AppColors.primaryLightBlue007BFF,
                              )),
                              child: SfDateRangePicker(
                                headerHeight: 60,
                                view: DateRangePickerView.month,
                                backgroundColor: AppColors.white,
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                showNavigationArrow: true,
                                selectionShape:
                                    DateRangePickerSelectionShape.rectangle,
                                selectionTextStyle:
                                    AppTextStyle.infoWhiteSemiBoldTextStyle,
                                selectionColor:
                                    AppColors.primaryLightBlue007BFF,
                                headerStyle: DateRangePickerHeaderStyle(
                                  textStyle: AppTextStyle.heading3TextStyle,
                                ),
                                monthViewSettings:
                                    DateRangePickerMonthViewSettings(
                                  showTrailingAndLeadingDates: true,
                                  firstDayOfWeek: 1,
                                  viewHeaderStyle:
                                      DateRangePickerViewHeaderStyle(
                                    textStyle:
                                        AppTextStyle.subHeading4DarkTextStyle,
                                  ),
                                ),
                                monthCellStyle: DateRangePickerMonthCellStyle(
                                  cellDecoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.greyDDDDDD,
                                    ),
                                  ),
                                  todayTextStyle: AppTextStyle
                                      .subHeading4PrimaryColorSemiBoldTextStyle,
                                ),
                                initialSelectedDate: DateTime.now(),
                              ),
                            )
                          : Container(),
                    ],
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
