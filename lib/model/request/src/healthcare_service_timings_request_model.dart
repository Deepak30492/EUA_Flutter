import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareServiceTimingsRequestModel {
  ContextModel? context;
  HealthcareServiceTimingsMessage? message;

  HealthcareServiceTimingsRequestModel({this.context, this.message});

  HealthcareServiceTimingsRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareServiceTimingsMessage.fromJson(json['message'])
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

class HealthcareServiceTimingsMessage {
  HealthcareServiceTimingsIntent? intent;

  HealthcareServiceTimingsMessage({this.intent});

  HealthcareServiceTimingsMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareServiceTimingsIntent.fromJson(json['intent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.intent != null) {
      data['intent'] = this.intent!.toJson();
    }
    return data;
  }
}

class HealthcareServiceTimingsIntent {
  HealthcareServiceTimingsFulfillment? fulfillment;

  HealthcareServiceTimingsIntent({this.fulfillment});

  HealthcareServiceTimingsIntent.fromJson(Map<String, dynamic> json) {
    fulfillment = json['fulfillment'] != null
        ? new HealthcareServiceTimingsFulfillment.fromJson(json['fulfillment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fulfillment != null) {
      data['fulfillment'] = this.fulfillment!.toJson();
    }
    return data;
  }
}

class HealthcareServiceTimingsFulfillment {
  HealthcareServiceTimingsStart? start;
  HealthcareServiceTimingsStart? end;

  HealthcareServiceTimingsFulfillment({this.start, this.end});

  HealthcareServiceTimingsFulfillment.fromJson(Map<String, dynamic> json) {
    start = json['start'] != null
        ? new HealthcareServiceTimingsStart.fromJson(json['start'])
        : null;
    end = json['end'] != null
        ? new HealthcareServiceTimingsStart.fromJson(json['end'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.start != null) {
      data['start'] = this.start!.toJson();
    }
    if (this.end != null) {
      data['end'] = this.end!.toJson();
    }
    return data;
  }
}

class HealthcareServiceTimingsStart {
  HealthcareServiceTimingsTime? time;

  HealthcareServiceTimingsStart({this.time});

  HealthcareServiceTimingsStart.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null
        ? new HealthcareServiceTimingsTime.fromJson(json['time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    return data;
  }
}

class HealthcareServiceTimingsTime {
  String? timestamp;

  HealthcareServiceTimingsTime({this.timestamp});

  HealthcareServiceTimingsTime.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    return data;
  }
}
