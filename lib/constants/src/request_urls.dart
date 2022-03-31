class RequestUrls {
  ///IP AND PORT
  static String port = "";
  static String ipAddress = "";

  ///HTTP, IP AND PORT
  static const String httpIpPort =
      "https://258b9ddd-7da3-4437-af3c-6d3a1e9926a3.mock.pstmn.io/api/v1/";

  ///URLS
  static const String postSearchDetails = "${httpIpPort}search";

  static const String postDoctorDetails = "${httpIpPort}select";

  static const String postBookingDetails = "${httpIpPort}confirm";

  static const String getDetails = "${httpIpPort}";
}
