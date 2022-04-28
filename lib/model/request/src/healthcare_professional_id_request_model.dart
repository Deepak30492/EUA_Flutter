import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareProfessionalIdRequestModel {
  ContextModel? context;
  HealthcareProfessionalIdMessage? message;

  HealthcareProfessionalIdRequestModel({this.context, this.message});

  HealthcareProfessionalIdRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareProfessionalIdMessage.fromJson(json['message'])
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

class HealthcareProfessionalIdMessage {
  HealthcareProfessionalIdIntent? intent;

  HealthcareProfessionalIdMessage({this.intent});

  HealthcareProfessionalIdMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareProfessionalIdIntent.fromJson(json['intent'])
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

class HealthcareProfessionalIdIntent {
  HealthcareProfessionalIdFulfillment? fulfillment;

  HealthcareProfessionalIdIntent({this.fulfillment});

  HealthcareProfessionalIdIntent.fromJson(Map<String, dynamic> json) {
    fulfillment = json['fulfillment'] != null
        ? new HealthcareProfessionalIdFulfillment.fromJson(json['fulfillment'])
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

class HealthcareProfessionalIdFulfillment {
  HealthcareProfessionalIdPerson? person;

  HealthcareProfessionalIdFulfillment({this.person});

  HealthcareProfessionalIdFulfillment.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null
        ? new HealthcareProfessionalIdPerson.fromJson(json['person'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    return data;
  }
}

class HealthcareProfessionalIdPerson {
  String? cred;

  HealthcareProfessionalIdPerson({this.cred});

  HealthcareProfessionalIdPerson.fromJson(Map<String, dynamic> json) {
    cred = json['cred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cred'] = this.cred;
    return data;
  }
}
