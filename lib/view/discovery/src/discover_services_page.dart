import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/src/app_text_style.dart';
import 'package:uhi_eua_flutter_app/widgets/src/spacing.dart';

import 'book_a_teleconsultation_page.dart';

class DiscoverServicesPage extends StatefulWidget {
  const DiscoverServicesPage({Key? key}) : super(key: key);

  @override
  State<DiscoverServicesPage> createState() => _DiscoverServicesPageState();
}

class _DiscoverServicesPageState extends State<DiscoverServicesPage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  @override
  Widget build(BuildContext context) {
    ///ASSIGNING VALUES
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          size: 25,
          color: Colors.black,
        ),
        title: Container(
          child: Text(
            "ABDM",
            style: AppTextStyle.appbarTitleTextStyle,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Container(
                width: width,
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF264488),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover\nServices",
                      style: AppTextStyle.heading2TextStyle,
                    ),
                    Spacing(isWidth: false),
                    Container(
                      width: width * 0.08,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacing(isWidth: false),
                    Text(
                      "What are you looking for today?",
                      style: AppTextStyle.subHeading1TextStyle,
                    ),
                  ],
                ),
              ),

              //Search bar
              // Container(
              //   child: Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       Container(
              //         width: width,
              //         padding: const EdgeInsets.only(top: 25),
              //         decoration: const BoxDecoration(
              //           color: Color(0xFF264488),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Get.to(() => const BookATeleconsultationPage());
              //         },
              //         child: Center(
              //           child: Container(
              //             width: width * 0.94,
              //             height: height * 0.07,
              //             // padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //               boxShadow: const [
              //                 BoxShadow(
              //                   offset: Offset(0, 10),
              //                   blurRadius: 20,
              //                   color: Color(0x1B1C204D),
              //                 )
              //               ],
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Container(
              //                   width: width * 0.8,
              //                   padding:
              //                       const EdgeInsets.fromLTRB(20, 5, 20, 5),
              //                   child: TextField(
              //                     decoration: InputDecoration(
              //                       hintText: "Search services",
              //                       hintStyle:
              //                           AppTextStyle.textFieldHintTextStyle,
              //                       border: InputBorder.none,
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   width: width * 0.14,
              //                   decoration: const BoxDecoration(
              //                     color: Color(0xFFE8705A),
              //                     borderRadius: BorderRadius.only(
              //                       bottomRight: Radius.circular(5),
              //                       topRight: Radius.circular(5),
              //                     ),
              //                   ),
              //                   child: const Center(
              //                     child: Icon(
              //                       Icons.search,
              //                       size: 25,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              //Favourites
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Your Favourite Services",
                        style: AppTextStyle.subHeading3TextStyle,
                      ),
                    ),
                    Spacing(size: 20, isWidth: false),
                    Container(
                      height: height * 0.24,
                      // color: Colors.amber,
                      // padding: EdgeInsets.only(top: 10),
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        separatorBuilder: (context, index) {
                          return Spacing(size: 20);
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => const BookATeleconsultationPage());
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: width * 0.34,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 15,
                                            color: Color(0x1B1C204D),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * 0.13,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: Image.network(
                                                  "https://picsum.photos/200",
                                                ).image,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Spacing(size: 30, isWidth: false),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Text(
                                              "Teleconsultation",
                                              style: AppTextStyle
                                                  .subHeading4TextStyle,
                                            ),
                                          ),
                                          // Stack(
                                          //   clipBehavior: Clip.none,
                                          //   children: [
                                          //     Container(
                                          //       padding: EdgeInsets.only(top: 20),
                                          //     ),
                                          //     Center(
                                          //       child: Container(
                                          //         width: width * 0.12,
                                          //         height: width * 0.12,
                                          //         decoration: const BoxDecoration(
                                          //           shape: BoxShape.circle,
                                          //           color: Colors.white,
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               offset: Offset(0, 10),
                                          //               blurRadius: 15,
                                          //               color: Color(0x1B1C204D),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * 0.12,
                                            height: width * 0.12,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 10),
                                                  blurRadius: 30,
                                                  color: Color(0x1B1C204D),
                                                )
                                              ],
                                            ),
                                            child: const Icon(
                                              Icons.image_outlined,
                                              size: 20,
                                              color: Color(0xFFE8705A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //Upcoming Appointments
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Upcoming Appointments",
                        style: AppTextStyle.subHeading3TextStyle,
                      ),
                    ),
                    Spacing(size: 20, isWidth: false),
                    Container(
                      height: height * 0.22,
                      // color: Colors.amber,
                      // padding: EdgeInsets.only(top: 10),
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        separatorBuilder: (context, index) {
                          return Spacing(size: 20);
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  width: width * 0.8,
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 10,
                                        color: Color(0x1B1C204D),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.14,
                                            height: width * 0.2,
                                            margin: EdgeInsets.only(top: 12),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: Image.network(
                                                          "https://picsum.photos/200")
                                                      .image),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, top: 20, right: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Priya Kaur",
                                                      style: AppTextStyle
                                                          .subHeading3TextStyle,
                                                    ),
                                                    Spacing(),
                                                    Text(
                                                      "Cardiologist",
                                                      style: AppTextStyle
                                                          .subHeading3LightTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                Spacing(),
                                                Text(
                                                  "20 minutes",
                                                  style: AppTextStyle
                                                      .subHeading3TextStyle,
                                                ),
                                                Spacing(),
                                                Text(
                                                  "Tomorrow at 8:42 AM",
                                                  style: AppTextStyle
                                                      .subHeading4LightTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: const Icon(
                                              Icons.more_horiz,
                                              size: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacing(isWidth: false),
                                      Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1,
                                          color: Color(0xFFF0F3F4),
                                          // color: Colors.green,
                                        ))),
                                      ),
                                      Spacing(isWidth: false),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.close_rounded,
                                                    size: 25,
                                                    color: Color(0xFF394050),
                                                  ),
                                                  Spacing(size: 5),
                                                  Text(
                                                    "Cancel Appointment",
                                                    style: AppTextStyle
                                                        .textBtnTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .chat_bubble_outline_rounded,
                                                    size: 25,
                                                    color: Color(0xFF394050),
                                                  ),
                                                  Spacing(size: 5),
                                                  Text(
                                                    "Message",
                                                    style: AppTextStyle
                                                        .textBtnTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacing(size: 5, isWidth: false),
                                    ],
                                  )),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //Appointment History
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Appointment History",
                        style: AppTextStyle.subHeading3TextStyle,
                      ),
                    ),
                    Spacing(size: 20, isWidth: false),
                    Container(
                      height: height * 0.22,
                      // color: Colors.amber,
                      // padding: EdgeInsets.only(top: 10),
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        separatorBuilder: (context, index) {
                          return Spacing(size: 20);
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  width: width * 0.8,
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 10,
                                        color: Color(0x1B1C204D),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.14,
                                            height: width * 0.2,
                                            margin: EdgeInsets.only(top: 12),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: Image.network(
                                                          "https://picsum.photos/200")
                                                      .image),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 5, top: 20, right: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Priya Kaur",
                                                      style: AppTextStyle
                                                          .subHeading3TextStyle,
                                                    ),
                                                    Spacing(),
                                                    Text(
                                                      "Cardiologist",
                                                      style: AppTextStyle
                                                          .subHeading3LightTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                Spacing(),
                                                Text(
                                                  "20 minutes",
                                                  style: AppTextStyle
                                                      .subHeading3TextStyle,
                                                ),
                                                Spacing(),
                                                Text(
                                                  "11th April 2022 at 8:42 AM",
                                                  style: AppTextStyle
                                                      .subHeading4LightTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: const Icon(
                                              Icons.more_horiz,
                                              size: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacing(isWidth: false),
                                      Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1,
                                          color: Color(0xFFF0F3F4),
                                          // color: Colors.green,
                                        ))),
                                      ),
                                      Spacing(isWidth: false),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.remove_red_eye,
                                                    size: 25,
                                                    color: Color(0xFF394050),
                                                  ),
                                                  Spacing(size: 5),
                                                  Text(
                                                    "View Details",
                                                    style: AppTextStyle
                                                        .textBtnTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.check_box,
                                                    size: 25,
                                                    color: Color(0xFF394050),
                                                  ),
                                                  Spacing(size: 5),
                                                  Text(
                                                    "Book Again",
                                                    style: AppTextStyle
                                                        .textBtnTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacing(size: 5, isWidth: false),
                                    ],
                                  )),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
