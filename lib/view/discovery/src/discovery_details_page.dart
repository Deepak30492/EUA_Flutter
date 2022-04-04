import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/fulfillments/fulfillments.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class DiscoveryDetailsPage extends StatefulWidget {
  const DiscoveryDetailsPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryDetailsPage> createState() => _DiscoveryDetailsPageState();
}

class _DiscoveryDetailsPageState extends State<DiscoveryDetailsPage> {
  ///CONTROLLERS
  TextEditingController searchTextEditingController = TextEditingController();
  TextEditingController symptomsTextEditingController = TextEditingController();

  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///DATA VARIABLES
  String _dropdownValue = "Healthcare Professional Name";
  final List<String> _listOfDropdownValues = [
    "Healthcare Professional Name",
    "Healthcare Services Name",
  ];
  bool isShowLocationDialog = false;

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
                    // controller: _textEditingController,
                    style: AppTextStyle.textFieldTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search a professional, service etc.",
                      hintStyle: AppTextStyle.textFieldHintTextStyle,
                      contentPadding: const EdgeInsets.only(top: 15, left: 15),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.darkGrey323232,
                            size: 20,
                          ),
                        ),
                      ),
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
            Container(
              width: width * 0.94,
              child: Column(
                children: [
                  TextField(
                    // controller: _textEditingController,
                    style: AppTextStyle.textFieldTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tell us your symptoms",
                      hintStyle: AppTextStyle.textFieldHintTextStyle,
                      contentPadding: const EdgeInsets.only(top: 15, left: 15),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.darkGrey323232,
                          size: 20,
                        ),
                      ),
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
            Container(
              width: width * 0.94,
              child: Text(
                "10 results found",
                style: AppTextStyle.textFieldHintTextStyle,
              ),
            ),
            Spacing(isWidth: false),
            buildDoctorsList(),
          ],
        ),
      ),
    );
  }

  buildDoctorsList() {
    return Container(
      width: width * 0.94,
      height: height,
      child: ListView.builder(
        itemCount: 5,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildDoctorTile();
        },
      ),
    );
  }

  buildDoctorTile() {
    return InkWell(
      onTap: () {
        Get.to(() => const FulfillmentDetailsPage());
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
            Container(
              width: width * 0.3,
              height: height * 0.16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network("https://picsum.photos/200").image,
                  fit: BoxFit.fill,
                ),
              ),
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
                        "Dr. Neesheet Parikh, DO",
                        style: AppTextStyle.doctorNameSmallTextStyle,
                      ),
                    ),
                    Spacing(isWidth: false),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          text: "Max Hospital, Skin Specialist, ",
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
}
