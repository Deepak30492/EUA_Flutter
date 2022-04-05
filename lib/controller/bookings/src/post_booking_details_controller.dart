import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

class PostBookingDetailsController extends GetxController
    with ExceptionHandler {
  ///BOOKING DETAILS
  var bookingDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postBookingDetails({Object? bookingDetails}) async {
    if (bookingDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(url: RequestUrls.postSearchDetails, body: bookingDetails)
        .post()
        .then(
      (value) {
        if (value == null) {
        } else {
          AcknowledgementModel acknowledgementModel =
              AcknowledgementModel.fromJson(value);
          setBookingDetails(acknowledgementModel: acknowledgementModel);
        }
      },
    ).catchError(
      (onError) {
        log("Post Booking Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );

    state.value = DataState.complete;
  }

  setBookingDetails({required AcknowledgementModel? acknowledgementModel}) {
    if (acknowledgementModel == null) {
      return;
    }

    bookingDetails = acknowledgementModel;
  }

  @override
  refresh() async {
    ///POST BOOKING DETAILS
    postBookingDetails();
  }
}
