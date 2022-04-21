import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/controller/controller.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';

class GetFulfillmentDetailsController extends GetxController
    with ExceptionHandler {
  ///FULFILLMENT DETAILS
  List<ResponseModel>? fulfillmentDetails;

  ///STATE
  var state = DataState.loading.obs;

  ///ERROR STRING
  var errorString = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getFulfillmentDetails(
      {String? messageId, String? getUrlType}) async {
    if (fulfillmentDetails == null) {
      state.value = DataState.loading;
    }

    await BaseClient(url: "${RequestUrls.getDetails}/$messageId").get().then(
      (value) {
        if (value == null) {
        } else {
          List tmpList = value;
          List<ResponseModel>? listOfResponseModel =
              List<ResponseModel>.empty(growable: true);

          for (var index = 0; index < tmpList.length; index++) {
            listOfResponseModel.add(ResponseModel.fromJson(tmpList[index]));
          }

          setFulfillmentDetails(FulfillmentDetailsModel: listOfResponseModel);
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

  setFulfillmentDetails(
      {required List<ResponseModel>? FulfillmentDetailsModel}) {
    if (FulfillmentDetailsModel == null) {
      return;
    }

    fulfillmentDetails = FulfillmentDetailsModel;
  }

  @override
  refresh() async {
    fulfillmentDetails = null;
    errorString = '';

    // ///GET Fulfillment DETAILS
    // getFulfillmentDetails();
  }
}
