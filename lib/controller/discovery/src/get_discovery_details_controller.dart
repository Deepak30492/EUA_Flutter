import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

class GetDiscoveryDetailsController extends GetxController
    with ExceptionHandler {
  ///DISCOVERY DETAILS
  ResponseModel? discoveryDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getDiscoveryDetails(
      {String? messageId, String? getUrlType}) async {
    if (discoveryDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(url: "${RequestUrls.getDetails}/$messageId").get().then(
      (value) {
        if (value[0] == null) {
        } else {
          ResponseModel responseModel = ResponseModel.fromJson(value[0]);
          setDiscoveryDetails(discoveryDetailsModel: responseModel);
        }
      },
    ).catchError(
      (onError) {
        log("GET Search Details $onError ${onError.message}");

        errorString = "${onError.message}";

        handleError(onError, isShowDialog: true, isShowSnackbar: false);
      },
    );

    state.value = DataState.complete;
  }

  setDiscoveryDetails({required ResponseModel? discoveryDetailsModel}) {
    if (discoveryDetailsModel == null) {
      return;
    }

    discoveryDetails = discoveryDetailsModel;
  }

  @override
  refresh() async {
    discoveryDetails = null;

    // ///GET DISCOVERY DETAILS
    // getDiscoveryDetails();
  }
}
