import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';

///TO CHANGE STATE OF UI
// enum DataState { loading, complete }

class GetDoctorDetailsController extends GetxController with ExceptionHandler {
  ///BOOKING DETAILS
  var doctorDetails;
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

  Future<void> postDoctorDetails({Object? doctorDetails}) async {
    if (pageNumber == 0) {
      state.value = DataState.loading;
    } else {
      paginationLoading.value = true;
    }

    await BaseClient(url: RequestUrls.postDoctorDetails, body: doctorDetails)
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

  Future<void> getDoctorDetails({String? messageId, String? getUrlType}) async {
    if (doctorDetails == null) {
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
          // DoctorDetailsModel doctorDetailsModel =
          //     DoctorDetailsModel.fromJson(value);
          // setDoctorDetails(doctorDetailsModel: doctorDetailsModel);
        }
      },
    ).catchError(
      (onError) {
        log("Get Doctor Details $onError ${onError.message}");

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

  // setDoctorDetails({required DoctorDetailsModel doctorDetailsModel}) {
  //   if (doctorDetailsModel == null) {
  //     return;
  //   }

  //   doctorDetails = doctorDetailsModel;
  // }

  @override
  refresh() async {
    ///FETCH DOCTOR DETAILS
    getDoctorDetails();
  }
}
