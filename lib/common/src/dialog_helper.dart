import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyle.heading4TextStyle,
              ),

              ///SPACE
              const SizedBox(
                height: 10,
              ),

              ///DESCRIPTION
              Text(
                description,
                style: AppTextStyle.heading4TextStyle,
              ),

              ///SPACE
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 1.0),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Close',
                  style: AppTextStyle.button1TextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///SHOW LOADING
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                strokeWidth: 5,
              ),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  ///SHOW LOADING CIRCULAR INDICATOR
  static void showLoadingIndicator() {
    ///LOADING DIALOG OPENED
    Get.dialog(
      WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
              ),
            ),
          )),
      barrierDismissible: false,
    );
  }

  ///HIDE LOADING
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
