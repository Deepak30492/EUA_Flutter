import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class DiscoveryResultsPage extends StatefulWidget {
  const DiscoveryResultsPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryResultsPage> createState() => _DiscoveryResultsPageState();
}

class _DiscoveryResultsPageState extends State<DiscoveryResultsPage> {
  ///CONTROLLERS
  TextEditingController searchTextEditingController = TextEditingController();
  TextEditingController symptomsTextEditingController = TextEditingController();

  ///SIZE
  var width;
  var height;
  var isPortrait;

  bool showName = true;
  bool showSpecialty = true;
  bool showTimeSlots = true;

  ///DATA VARIABLES

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
        title: Text(
          "Search Result",
          style: AppTextStyle.doctorNameBigTextStyle,
        ),
      ),
      body: buildWidgets(),
    );
  }

  buildWidgets() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
      child: Container(
        width: width,
        height: height,
        color: AppColors.backgroundWhiteColorFBFCFF,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (showName || showSpecialty || showTimeSlots)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Search Results for",
                      style: AppTextStyle.doctorDegreeText,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8.0, bottom: 16),
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  showName
                      ? Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.tileColors)),
                          height: 31,
                          width: 70,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                child: Text(
                                  "Sana",
                                  style: AppTextStyle.doctorDegreeText,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: () {
                                    setState(() {
                                      showName = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 14,
                                    color: AppColors.doctorNameColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  showSpecialty
                      ? Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.tileColors)),
                          height: 31,
                          width: 105,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                child: Text(
                                  "Cardiology",
                                  style: AppTextStyle.doctorDegreeText,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: () {
                                    setState(() {
                                      showSpecialty = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 14,
                                    color: AppColors.doctorNameColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  showTimeSlots
                      ? Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.tileColors)),
                          height: 31,
                          width: 75,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                child: Text(
                                  "Today",
                                  style: AppTextStyle.doctorDegreeText,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: () {
                                    setState(() {
                                      showTimeSlots = false;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 14,
                                    color: AppColors.doctorNameColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            buildDoctorsList()
          ],
        ),
      ),
    );
  }

  buildDoctorsList() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: width,
      height: height * 0.71,
      child: ListView.separated(
        itemCount: 2,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildNewDoctorTile();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }

  buildNewDoctorTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadows.shadow3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image:
                              Image.network("https://picsum.photos/200").image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Sana Bhatt",
                          style: AppTextStyle.doctorNameText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "MBBS/MS Cardiology",
                          style: AppTextStyle.doctorDegreeText,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Marathi/Hindi/English",
                          style: AppTextStyle.doctorExperienceText,
                        ),
                        Text(
                          "12Years of experience",
                          style: AppTextStyle.doctorExperienceText,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.verified_user_rounded,
                        size: 24,
                        color: AppColors.amountColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "1309 ",
                    style: AppTextStyle.locationDistanceSmallTextStyle,
                    children: [
                      TextSpan(
                        text: " Teleconsults",
                        style: AppTextStyle.doctorDegreeText,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "80%  ",
                    style: AppTextStyle.locationDistanceSmallTextStyle,
                    children: [
                      TextSpan(
                        text: "On time",
                        style: AppTextStyle.doctorDegreeText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: width,
            color: const Color.fromARGB(255, 238, 238, 238),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 6),
            child: Row(
              children: [
                Text(
                  "Choose any one app",
                  style: AppTextStyle.doctorDegreeText,
                ),
                SizedBox(
                  height: 16,
                  width: 16,
                  child: IconButton(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info,
                      size: 18,
                      color: AppColors.infoIconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.tileColors)),
                  height: 31,
                  width: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                        child: Text(
                          "Rs900",
                          style: AppTextStyle.amountText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.tileColors)),
                  height: 31,
                  width: 140,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                        child: Text(
                          "Rs500",
                          style: AppTextStyle.amountText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDoctorTile() {
    return InkWell(
      onTap: () {
        // Get.to(() => const FulfillmentDetailsPage());
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
