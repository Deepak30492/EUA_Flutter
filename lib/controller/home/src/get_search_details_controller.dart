import 'dart:developer';

import 'package:get/get.dart';
import 'package:uhi_eua_flutter_app/constants/constants.dart';
import 'package:uhi_eua_flutter_app/model/model.dart';
import 'package:uhi_eua_flutter_app/services/services.dart';

///TO CHANGE STATE OF UI
enum DataState { loading, complete }

class GetSearchDetailsController extends GetxController with ExceptionHandler {
  ///FULFILLMENTS LIST
  // var fulfillmentsList = List<Fulfillments>.empty(growable: true).obs;
  // AcknowledgementModel reponseDetails = AcknowledgementModel();
  var searchDetails;

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

  Future<void> postSearchDetails(
      {Object? searchDetails, String? searchType}) async {
    if (pageNumber == 0) {
      state.value = DataState.loading;
    } else {
      paginationLoading.value = true;
    }

    // if (searchType == DataValues.healthcareServiceName) {
    //   searchDetails =
    //       searchDetails as SearchByHealthcareServiceNameRequestModel;
    // } else if (searchType == DataValues.healthcareProfessionalName) {
    //   searchDetails =
    //       searchDetails as SearchByHealthcareProfessionalNameRequestModel;
    // }

    await BaseClient(url: RequestUrls.postSearchDetails, body: searchDetails)
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

  Future<void> getSearchDetails({String? messageId, String? getUrlType}) async {
    if (pageNumber == 0) {
      state.value = DataState.loading;
    } else {
      paginationLoading.value = true;
    }

    await BaseClient(
            url:
                "${RequestUrls.postSearchDetails}/message/$messageId?dhp_query_type=$getUrlType")
        .get()
        .then(
      (value) {
        if (value == null) {
        } else {
          // SearchDetailsModel searchDetailsModel =
          //     SearchDetailsModel.fromJson(value);
          // setSearchDetails(searchDetailsModel: searchDetailsModel);
        }
      },
    ).catchError(
      (onError) {
        log("GET Search Details $onError ${onError.message}");

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

  // setSearchDetails({required SearchDetailsModel searchDetailsModel}) {
  //   if (searchDetailsModel == null) {
  //     return;
  //   }

  //   searchDetails = searchDetailsModel;
  // }

  @override
  refresh() async {
    ///POST SEARCH DETAILS
    postSearchDetails();
  }
}
