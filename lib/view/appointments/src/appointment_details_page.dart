import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class AppointmentDetailsPage extends StatefulWidget {
  const AppointmentDetailsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  ///SIZE
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    ///ASSIGNING VALUES
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
          "Appointment Details",
          style: AppTextStyle.doctorNameBigTextStyle,
        ),
        centerTitle: true,
        bottom: const AppbarBottomLine(),
      ),
      body: buildWidgets(),
    );
  }

  buildWidgets() {
    return Container(
      width: width,
      height: height,
      color: AppColors.backgroundWhiteColorFBFCFF,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: AppColors.primaryLightBlue007BFF),
              header: const Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Text(
                  'Appointment',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
              ),
              collapsed: Container(
                height: 130,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Date Time',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '14th April 2022, 09:00 AM to 10:00 AM',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Appointment Id ',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'id-483988',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Status ',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Confirmed',
                            style: TextStyle(
                                color: AppColors.confirmTextColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator()
                    ],
                  ),
                ),
              ),
              expanded: Container(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: AppColors.primaryLightBlue007BFF),
              header: const Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Text(
                  'Fulfillment',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
              ),
              collapsed: Container(
                height: 130,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Id',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'id-432984',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Provider',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Tele-consultation',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Status ',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Appointment Link',
                            style: TextStyle(
                                color: AppColors.linkTextColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator()
                    ],
                  ),
                ),
              ),
              expanded: Container(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: AppColors.primaryLightBlue007BFF),
              header: const Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Text(
                  'Patient Info',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
              ),
              expanded: Container(
                height: 130,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_outlined,
                              size: 24, color: AppColors.black),
                          const SizedBox(width: 16),
                          const Text(
                            'Aadya Singh',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.place_outlined,
                              size: 24, color: AppColors.black),
                          const SizedBox(width: 16),
                          const Text(
                            '8502 Preston Rd. Inglewood, Maine 98380',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.call_outlined,
                              size: 24, color: AppColors.black),
                          const SizedBox(width: 16),
                          const Text(
                            '7725068610',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator()
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: AppColors.primaryLightBlue007BFF),
              header: const Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Text(
                  'Payment',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
              ),
              expanded: Container(
                height: 100,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Consultation',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '₹ 500',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Online Charges',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '₹ 500',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _separator(),
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
            ),
          ),
          Center(
            child: InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryLightBlue007BFF),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Contact Support",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _separator() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: SizedBox(
        height: 1,
        width: MediaQuery.of(context).size.width,
        child: Container(color: AppColors.innerBoxColor),
      ),
    );
  }
}
