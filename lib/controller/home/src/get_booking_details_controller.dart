import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';

///TO CHANGE STATE OF UI
// enum DataState { loading, complete }

class GetBookingDetailsController extends GetxController with ExceptionHandler {
  ///BOOKING DETAILS
  var bookingDetails;
  var reponseDetails;

  ///STATE
  var state = DataState.loading.obs;

  var paginationLoading = false.obs;

  ///ERROR STRING
  var errorString = '';

  ///PAGE SIZE
  int pageSize = 5;

  ///PAGE NUMBER
  int pageNumber = 0;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postBookingDetails({Object? bookingDetails}) async {
    if (pageNumber == 0) {
      state.value = DataState.loading;
    } else {
      paginationLoading.value = true;
    }

    await BaseClient(url: RequestUrls.postSearchDetails, body: bookingDetails)
        .post()
        .then(
      (value) {
        if (value == null) {
        } else {
          // AcknowledgementModel acknowledgementModel =
          //     AcknowledgementModel.fromJson(value);
          // setReponseDetails(acknowledgementModel: acknowledgementModel);
        }
      },
    ).catchError(
      (onError) {
        log("POST Search Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );
    paginationLoading.value = false;
    state.value = DataState.complete;
  }

  Future<void> getBookingDetails(
      {String? messageId, String? getUrlType}) async {
    if (bookingDetails == null) {
      state.value = DataState.loading;
    } else {
      state.value = DataState.complete;
    }

    await BaseClient(
            url:
                "${RequestUrls.postSearchDetails}/message/$messageId?dhp_query_type=$getUrlType")
        .get()
        .then(
      (value) {
        if (value == null) {
        } else {
          // BookingDetailsModel bookingDetailsModel =
          //     BookingDetailsModel.fromJson(value);
          // setBookingDetails(bookingDetailsModel: bookingDetailsModel);
        }
      },
    ).catchError(
      (onError) {
        log("Get Booking Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );
    paginationLoading.value = false;
    state.value = DataState.complete;
  }

  // setReponseDetails({required AcknowledgementModel acknowledgementModel}) {
  //   if (acknowledgementModel == null) {
  //     return;
  //   }

  //   reponseDetails = acknowledgementModel;
  // }

  // setBookingDetails({required BookingDetailsModel bookingDetailsModel}) {
  //   if (bookingDetailsModel == null) {
  //     return;
  //   }

  //   bookingDetails = bookingDetailsModel;
  // }

  @override
  refresh() async {
    ///FETCH BOOKING DETAILS
    getBookingDetails();
  }
}
