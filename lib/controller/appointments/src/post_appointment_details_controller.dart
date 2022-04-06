import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

class PostAppointmentDetailsController extends GetxController
    with ExceptionHandler {
  ///APPOINTMENT DETAILS
  var appointmentDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postAppointmentDetails({Object? appointmentDetails}) async {
    if (appointmentDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(
            url: RequestUrls.postSearchDetails, body: appointmentDetails)
        .post()
        .then(
      (value) {
        if (value == null) {
        } else {
          AcknowledgementModel acknowledgementModel =
              AcknowledgementModel.fromJson(value);
          setAppointmentDetails(acknowledgementModel: acknowledgementModel);
        }
      },
    ).catchError(
      (onError) {
        log("Post Appointment Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );

    state.value = DataState.complete;
  }

  setAppointmentDetails({required AcknowledgementModel? acknowledgementModel}) {
    if (acknowledgementModel == null) {
      return;
    }

    appointmentDetails = acknowledgementModel;
  }

  @override
  refresh() async {
    ///POST APPOINTMENT DETAILS
    postAppointmentDetails();
  }
}
