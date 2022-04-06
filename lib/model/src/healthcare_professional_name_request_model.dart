import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareProfessionalNameRequestModel {
  ContextModel? context;
  HealthcareProfessionalNameMessage? message;

  HealthcareProfessionalNameRequestModel({this.context, this.message});

  HealthcareProfessionalNameRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareProfessionalNameMessage.fromJson(json['message'])
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

class HealthcareProfessionalNameMessage {
  HealthcareProfessionalNameIntent? intent;

  HealthcareProfessionalNameMessage({this.intent});

  HealthcareProfessionalNameMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareProfessionalNameIntent.fromJson(json['intent'])
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

class HealthcareProfessionalNameIntent {
  HealthcareProfessionalNameFulfillment? fulfillment;

  HealthcareProfessionalNameIntent({this.fulfillment});

  HealthcareProfessionalNameIntent.fromJson(Map<String, dynamic> json) {
    fulfillment = json['fulfillment'] != null
        ? new HealthcareProfessionalNameFulfillment.fromJson(
            json['fulfillment'])
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

class HealthcareProfessionalNameFulfillment {
  HealthcareProfessionalNamePerson? person;

  HealthcareProfessionalNameFulfillment({this.person});

  HealthcareProfessionalNameFulfillment.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null
        ? new HealthcareProfessionalNamePerson.fromJson(json['person'])
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

class HealthcareProfessionalNamePerson {
  HealthcareProfessionalNameDescriptor? descriptor;

  HealthcareProfessionalNamePerson({this.descriptor});

  HealthcareProfessionalNamePerson.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new HealthcareProfessionalNameDescriptor.fromJson(json['descriptor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    return data;
  }
}

class HealthcareProfessionalNameDescriptor {
  String? name;

  HealthcareProfessionalNameDescriptor({this.name});

  HealthcareProfessionalNameDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
