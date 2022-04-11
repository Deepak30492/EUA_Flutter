import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

///TO CHANGE STATE OF UI
enum DataState { loading, complete }

class PostDiscoveryDetailsController extends GetxController
    with ExceptionHandler {
  ///DISCOVERY DETAILS
  AcknowledgementModel? discoveryDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postDiscoveryDetails(
      {Object? discoveryDetails, String? discoveryType}) async {
    if (discoveryDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(
            url: RequestUrls.postDiscoveryDetails, body: discoveryDetails)
        .post()
        .then(
      (value) {
        if (value == null) {
        } else {
          AcknowledgementModel acknowledgementModel =
              AcknowledgementModel.fromJson(value);
          setDiscoveryDetails(acknowledgementModel: acknowledgementModel);
        }
      },
    ).catchError(
      (onError) {
        log("Post Discovery Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );

    state.value = DataState.complete;
  }

  setDiscoveryDetails({required AcknowledgementModel? acknowledgementModel}) {
    if (acknowledgementModel == null) {
      return;
    }

    discoveryDetails = acknowledgementModel;
  }

  @override
  refresh() async {
    errorString = '';

    ///POST DISCOVERY DETAILS
    // postDiscoveryDetails();
  }
}
