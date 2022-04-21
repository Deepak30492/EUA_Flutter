import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

class PostFulfillmentDetailsController extends GetxController
    with ExceptionHandler {
  ///DISCOVERY DETAILS
  AcknowledgementModel? fulfillmentAckDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postFulfillmentDetails({Object? fulfillmentDetails}) async {
    if (fulfillmentDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(
            url: RequestUrls.postFulfillmentDetails, body: fulfillmentDetails)
        .post()
        .then(
      (value) {
        if (value == null) {
        } else {
          AcknowledgementModel acknowledgementModel =
              AcknowledgementModel.fromJson(value);
          setFulfillmentDetails(acknowledgementModel: acknowledgementModel);
        }
      },
    ).catchError(
      (onError) {
        log("Post Fulfillment Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );

    state.value = DataState.complete;
  }

  setFulfillmentDetails({required AcknowledgementModel? acknowledgementModel}) {
    if (acknowledgementModel == null) {
      return;
    }

    fulfillmentAckDetails = acknowledgementModel;
  }

  @override
  refresh() async {
    errorString = '';

    ///POST FULFILLMENT DETAILS
    // postFulfillmentDetails();
  }
}
