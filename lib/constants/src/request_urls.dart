class RequestUrls {
  ///IP AND PORT
  static String port = "";
  static String ipAddress = "";

  ///HTTP, IP AND PORT
  static const String httpIpPort =
      "https://258b9ddd-7da3-4437-af3c-6d3a1e9926a3.mock.pstmn.io/api/v1/";

  ///URLS
  ///SEARCH API URL
  static String postDiscoveryDetails = "${httpIpPort}search";

  ///SELECT API URL
  static String postFulfillmentDetails = "${httpIpPort}select";

  ///CONFIRM API URL
  static String postBookingDetails = "${httpIpPort}confirm";

  ///GET URLS
  ///Common GET URL for all APIs
  static String getDetails = "${httpIpPort}message";
}
