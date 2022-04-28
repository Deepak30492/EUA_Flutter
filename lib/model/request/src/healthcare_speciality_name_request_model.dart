import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareSpecialityNameRequestModel {
  ContextModel? context;
  HealthcareSpecialityNameMessage? message;

  HealthcareSpecialityNameRequestModel({this.context, this.message});

  HealthcareSpecialityNameRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareSpecialityNameMessage.fromJson(json['message'])
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

class HealthcareSpecialityNameMessage {
  HealthcareSpecialityNameIntent? intent;

  HealthcareSpecialityNameMessage({this.intent});

  HealthcareSpecialityNameMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareSpecialityNameIntent.fromJson(json['intent'])
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

class HealthcareSpecialityNameIntent {
  HealthcareSpecialityNameCategory? category;
  Fulfillment? fulfillment;

  HealthcareSpecialityNameIntent({this.category, this.fulfillment});

  HealthcareSpecialityNameIntent.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? HealthcareSpecialityNameCategory.fromJson(json['category'])
        : null;
    fulfillment = json['fulfillment'] != null
        ? new Fulfillment.fromJson(json['fulfillment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.fulfillment != null) {
      data['fulfillment'] = this.fulfillment!.toJson();
    }
    return data;
  }
}

class HealthcareSpecialityNameCategory {
  HealthcareSpecialityNameDescriptor? descriptor;

  HealthcareSpecialityNameCategory({this.descriptor});

  HealthcareSpecialityNameCategory.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new HealthcareSpecialityNameDescriptor.fromJson(json['descriptor'])
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

class HealthcareSpecialityNameDescriptor {
  String? name;

  HealthcareSpecialityNameDescriptor({this.name});

  HealthcareSpecialityNameDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class HealthcareSpecialityNameFulfillment {
  HealthcareSpecialityNameCategory? person;

  HealthcareSpecialityNameFulfillment({this.person});

  HealthcareSpecialityNameFulfillment.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null
        ? new HealthcareSpecialityNameCategory.fromJson(json['person'])
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
