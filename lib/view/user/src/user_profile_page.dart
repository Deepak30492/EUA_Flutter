import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';
import 'package:uhi_eua_flutter_app/view/discovery/src/discovery_details_page.dart';
import 'package:uhi_eua_flutter_app/view/view.dart';
import 'package:uhi_eua_flutter_app/widgets/widgets.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  ///SIZE
  var width;
  var height;
  var isPortrait;

  ///DATA VARIABLES
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
        title: Text(
          "Profile",
          style: AppTextStyle.doctorNameBigTextStyle,
        ),
        centerTitle: true,
        bottom: const AppbarBottomLine(),
      ),
      body: SingleChildScrollView(
        child: buildWidgets(),
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
          Spacing(size: 20, isWidth: false),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(children: [
              Text(
                "Please fill your personal details which will be used for booking an appointment",
                style: AppTextStyle.subHeading4DarkTextStyle,
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          Spacing(size: 50, isWidth: false),
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
                // controller: _textEditingController,
                style: AppTextStyle.textFieldTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Full name",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
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
            height: height * 0.062,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: Center(
              child: TextField(
                // controller: _textEditingController,
                style: AppTextStyle.textFieldTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Address",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.place_outlined,
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
            height: height * 0.062,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: Center(
              child: TextField(
                // controller: _textEditingController,
                style: AppTextStyle.textFieldTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Contact number",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.call_outlined,
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
            height: height * 0.062,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadows.shadow1,
            ),
            child: Center(
              child: TextField(
                // controller: _textEditingController,
                style: AppTextStyle.textFieldTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: AppTextStyle.textFieldHintTextStyle,
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryLightBlue007BFF,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          Spacing(size: 20, isWidth: false),
          InkWell(
            onTap: () {
              Get.back();
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
                  "Save Details",
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
