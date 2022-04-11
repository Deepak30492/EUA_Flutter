class RequestUrls {
  ///IP AND PORT
  static String port = "80";
  static String ipAddress = "3.208.12.38";

  ///HTTP, IP AND PORT
  static String httpIpPort = "http://$ipAddress/api/v1/";

  ///URLS
  static String postDiscoveryDetails = "${httpIpPort}search";

  static String postDoctorDetails = "${httpIpPort}select";

  static String postBookingDetails = "${httpIpPort}confirm";

  static String getDetails = "${httpIpPort}message";
}
