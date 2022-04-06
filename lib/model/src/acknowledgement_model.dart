import 'package:uhi_eua_flutter_app/model/model.dart';

class AcknowledgementModel {
  ContextModel? context;
  AcknowledgementModelMessage? message;

  AcknowledgementModel({this.context, this.message});

  AcknowledgementModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new AcknowledgementModelMessage.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class AcknowledgementModelMessage {
  Ack? ack;

  AcknowledgementModelMessage({this.ack});

  AcknowledgementModelMessage.fromJson(Map<String, dynamic> json) {
    ack = json['ack'] != null ? new Ack.fromJson(json['ack']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ack != null) {
      data['ack'] = this.ack!.toJson();
    }
    return data;
  }
}

class Ack {
  String? status;

  Ack({this.status});

  Ack.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
