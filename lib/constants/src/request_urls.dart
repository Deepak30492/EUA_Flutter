class RequestUrls {
  ///IP AND PORT
  static String port = "80";
  static String ipAddress = "3.208.12.38";

  ///HTTP, IP AND PORT
  static String httpIpPort = "http://$ipAddress/api/v1/";

  ///POST URLS
  static String postDiscoveryDetails = "${httpIpPort}search";

  static String postFulfillmentDetails = "${httpIpPort}select";

  static String postBookingDetails = "${httpIpPort}confirm";

  //GET URLS
  static String getDetails = "${httpIpPort}message";
}
