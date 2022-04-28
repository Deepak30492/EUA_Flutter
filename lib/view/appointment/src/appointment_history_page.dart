import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class AppointmentHistoryPage extends StatefulWidget {
  const AppointmentHistoryPage({Key? key}) : super(key: key);

  @override
  State<AppointmentHistoryPage> createState() => _AppointmentHistoryPageState();
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  ///CONTROLLERS
  TextEditingController searchTextEditingController = TextEditingController();
  TextEditingController symptomsTextEditingController = TextEditingController();

  ///SIZE
  var width;
  var height;
  var isPortrait;

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
          "Appointment history",
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
          children: [buildDoctorsList()],
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
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
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
                        Row(
                          children: [
                            Text(
                              "Priya Kaur",
                              style: AppTextStyle.doctorNameText,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Cardiologist",
                              style: AppTextStyle.doctorDegreeText,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "20 minutes",
                          style: AppTextStyle.doctorNameText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "11th April 2022 at 8:42 AM",
                          style: AppTextStyle.doctorExperienceText,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
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
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 16,
                        child: Icon(
                          Icons.visibility,
                          color: AppColors.grey787878,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "View Details",
                        style: AppTextStyle.doctorDegreeText,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 16,
                        child: Icon(
                          Icons.check_box,
                          color: AppColors.grey787878,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Book Again",
                        style: AppTextStyle.doctorDegreeText,
                      ),
                    ],
                  ),
                )
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
