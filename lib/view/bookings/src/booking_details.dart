import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///DATA VARIABLES
  int? _selectedTimeSlotIndex;

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
          "Dr. Neesheet Parikh, DO",
          style: AppTextStyle.doctorNameBigTextStyle,
        ),
        centerTitle: true,
        bottom: const AppbarBottomLine(),
      ),
      body: Container(
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
                imageUrl: "",
                hospitalName: "",
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
                      padding: const EdgeInsets.only(
                          left: 30, top: 15, right: 30, bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: AppShadows.shadow1,
                      ),
                      child: Text(
                        "Sunday, 14th April 2022, 09:00 AM to 10:00 AM",
                        style: AppTextStyle.subHeading4DarkTextStyle,
                      ),
                    ),
                    Spacing(size: 20, isWidth: false),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient Info",
                            style: AppTextStyle.subHeading4SemiBoldTextStyle,
                          ),
                          Text(
                            "Edit",
                            style: AppTextStyle
                                .subHeading4PrimaryColorSemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      width: width * 0.96,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: AppShadows.shadow1,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: AppColors.greyDDDDDD,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: AppColors.darkGrey363636,
                                  size: 20,
                                ),
                                Spacing(),
                                Text(
                                  "Aadya Singh",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: AppColors.greyDDDDDD,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.place_outlined,
                                  color: AppColors.darkGrey363636,
                                  size: 20,
                                ),
                                Spacing(),
                                Text(
                                  "8502 Preston Rd. Inglewood, Maine 98380",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call_outlined,
                                  color: AppColors.darkGrey363636,
                                  size: 20,
                                ),
                                Spacing(),
                                Text(
                                  "7725068610",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing(size: 20, isWidth: false),
                    Container(
                      child: Text(
                        "Payment",
                        style: AppTextStyle.subHeading4SemiBoldTextStyle,
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      width: width * 0.96,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: AppShadows.shadow1,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: AppColors.greyDDDDDD,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Consultation",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                                Text(
                                  "₹ 500",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Online Charges",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                                Text(
                                  "₹ 500",
                                  style: AppTextStyle.subHeading4DarkTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing(size: 80, isWidth: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomButtonWithFees(
        width: width,
        height: height,
        fees: "₹ 500",
        buttonName: "Pay",
      ),
    );
  }
}
