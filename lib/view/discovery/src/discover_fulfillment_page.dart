import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/discovery/src/discovery_details_page.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class DiscoverFulfillmentPage extends StatefulWidget {
  const DiscoverFulfillmentPage({Key? key}) : super(key: key);

  @override
  State<DiscoverFulfillmentPage> createState() =>
      _DiscoverFulfillmentPageState();
}

class _DiscoverFulfillmentPageState extends State<DiscoverFulfillmentPage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///CONTROLLERS
  TextEditingController _healthcareTextEditingController =
      TextEditingController();
  TextEditingController _symptomsTextEditingController =
      TextEditingController();

  ///DATA VARIABLES
  String _dropdownValue = HealthcareTypes.serviceProviderName;
  final List<String> _listOfDropdownValues = [
    HealthcareTypes.serviceProviderName,
    HealthcareTypes.professionalName,
    // HealthcareTypes.serviceName,
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
              Spacing(isWidth: true),
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
                        Spacing(isWidth: true),
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildWidgets(),
            // isShowLocationDialog
            //     ? InkWell(
            //         onTap: () {
            //           setState(() {
            //             isShowLocationDialog = !isShowLocationDialog;
            //           });
            //         },
            //         child: Container(
            //           width: width,
            //           height: height,
            //           color: Colors.black.withOpacity(0.3),
            //         ),
            //       )
            //     : Container(),
            // isShowLocationDialog
            //     ? Container(
            //         width: width,
            //         // height: height * 0.34,
            //         decoration: BoxDecoration(
            //           color: AppColors.white,
            //           borderRadius: const BorderRadius.only(
            //             bottomLeft: Radius.circular(15),
            //             bottomRight: Radius.circular(15),
            //           ),
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               height: 2,
            //               color: AppColors.primaryLightBlue007BFF,
            //             ),
            //             Container(
            //               width: width * 0.88,
            //               padding: const EdgeInsets.only(left: 20, top: 20),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Device location is not enabled",
            //                     style: AppTextStyle.subHeading3TextStyle,
            //                   ),
            //                   Text(
            //                     "Please enable device location to get your current location or you can manually search your location.",
            //                     style: AppTextStyle.subHeading5TextStyle,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             InkWell(
            //               onTap: () {
            //                 Get.to(const SearchLocation());
            //               },
            //               child: Container(
            //                 width: width * 0.9,
            //                 padding: const EdgeInsets.only(left: 20, top: 20),
            //                 child: Column(
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Icon(
            //                           Icons.place_outlined,
            //                           color: AppColors.greyHint828282,
            //                           size: 20,
            //                         ),
            //                         space(size: 5, isWidth: true),
            //                         Text(
            //                           "Search location",
            //                           style:
            //                               AppTextStyle.textFieldHintTextStyle,
            //                         ),
            //                       ],
            //                     ),
            //                     space(size: 8, isWidth: false),
            //                     Container(
            //                       height: 1,
            //                       color: AppColors.black,
            //                     ),
            //                   ],
            //                 ),
            //                 // child: TextField(
            //                 //   // controller: _textEditingController,
            //                 //   style: AppTextStyle.textFieldTextStyle,
            //                 //   readOnly: true,
            //                 //   decoration: InputDecoration(
            //                 //     border: const UnderlineInputBorder(),
            //                 //     enabledBorder: const UnderlineInputBorder(),
            //                 //     focusedBorder: const UnderlineInputBorder(),
            //                 //     hintText: "Search location",
            //                 //     hintStyle: AppTextStyle.textFieldHintTextStyle,
            //                 //     contentPadding:
            //                 //         const EdgeInsets.only(top: 10, left: 10),
            //                 //     prefixIcon: Padding(
            //                 //       padding: const EdgeInsets.only(right: 5),
            //                 //       child: Icon(
            //                 //         Icons.place_outlined,
            //                 //         color: AppColors.grey8B8B8B,
            //                 //         size: 20,
            //                 //       ),
            //                 //     ),
            //                 //     prefixIconConstraints: const BoxConstraints(
            //                 //         maxWidth: 30, maxHeight: 10),
            //                 //   ),
            //                 // ),
            //               ),
            //             ),
            //             space(size: 20, isWidth: false),
            //             Center(
            //               child: Text(
            //                 "Or",
            //                 style: AppTextStyle.subHeading4TextStyle,
            //               ),
            //             ),
            //             space(size: 20, isWidth: false),
            //             InkWell(
            //               onTap: () {},
            //               child: Center(
            //                 child: Container(
            //                   width: width * 0.6,
            //                   height: height * 0.06,
            //                   padding:
            //                       const EdgeInsets.only(left: 10, right: 25),
            //                   decoration: BoxDecoration(
            //                     color: AppColors.primaryLightBlue007BFF,
            //                     borderRadius: BorderRadius.circular(5),
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Icon(
            //                         Icons.my_location_rounded,
            //                         color: AppColors.white,
            //                         size: 20,
            //                       ),
            //                       Expanded(
            //                         child: Center(
            //                           child: Text(
            //                             "Enable Location",
            //                             style: AppTextStyle.button1TextStyle,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             space(size: 25, isWidth: false),
            //           ],
            //         ),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }

  buildWidgets() {
    return Container(
      width: width,
      height: height,
      color: AppColors.backgroundWhiteColorFBFCFF,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacing(size: 100, isWidth: false),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(children: [
              Text(
                "Search a doctor",
                style: AppTextStyle.heading1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Spacing(isWidth: false),
              Text(
                "Get access to multiple digital health services from this platform e.g. discover a doctor for your need at any time, get your required healthcare services, etc.",
                style: AppTextStyle.subHeading4TextStyle,
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          Spacing(size: 50, isWidth: false),
          Container(
            width: width * 0.9,
            height: height * 0.062,
            // height: 50,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
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
          Spacing(isWidth: false),
          Container(
            width: width * 0.9,
            height: height * 0.062,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: Center(
              child: TextField(
                controller: _healthcareTextEditingController,
                style: AppTextStyle.textFieldTextStyle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search a professional, service etc.",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.all(15),
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.primaryLightBlue007BFF,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          Spacing(isWidth: false),
          Container(
            width: width * 0.9,
            height: height * 0.16,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: Center(
              child: TextField(
                controller: _symptomsTextEditingController,
                style: AppTextStyle.textFieldTextStyle,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tell us your symptoms",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.only(left: 15, right: 15),
                ),
              ),
            ),
          ),
          Spacing(size: 30, isWidth: false),
          InkWell(
            onTap: () {
              Get.to(() => DiscoveryDetailsPage(
                    healthcareType: _dropdownValue,
                    searchHealthcareQuery:
                        _healthcareTextEditingController.text,
                    searchSymptomsQuery: _symptomsTextEditingController.text,
                  ));
            },
            child: Container(
              width: width * 0.9,
              height: height * 0.062,
              decoration: BoxDecoration(
                color: AppColors.primaryLightBlue007BFF,
                borderRadius: BorderRadius.circular(5),
                boxShadow: AppShadows.shadow1,
              ),
              child: Center(
                child: Text(
                  "Discover Doctors",
                  style: AppTextStyle.button1TextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
