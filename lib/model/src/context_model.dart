class ContextModel {
  String? domain;
  String? country;
  String? city;
  String? action;
  String? coreVersion;
  String? messageId;
  String? timestamp;
  String? consumerId;
  String? consumerUri;

  ContextModel(
      {this.domain,
      this.country,
      this.city,
      this.action,
      this.coreVersion,
      this.messageId,
      this.timestamp,
      this.consumerId,
      this.consumerUri});

  ContextModel.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    country = json['country'];
    city = json['city'];
    action = json['action'];
    coreVersion = json['core_version'];
    messageId = json['message_id'];
    timestamp = json['timestamp'];
    consumerId = json['consumer_id'];
    consumerUri = json['consumer_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domain'] = this.domain;
    data['country'] = this.country;
    data['city'] = this.city;
    data['action'] = this.action;
    data['core_version'] = this.coreVersion;
    data['message_id'] = this.messageId;
    data['timestamp'] = this.timestamp;
    data['consumer_id'] = this.consumerId;
    data['consumer_uri'] = this.consumerUri;

    return data;
  }
}
