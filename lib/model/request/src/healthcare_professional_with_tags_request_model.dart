import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareProfessionalWithTagsRequestModel {
  ContextModel? context;
  HealthcareProfessionalWithTagsMessage? message;

  HealthcareProfessionalWithTagsRequestModel({this.context, this.message});

  HealthcareProfessionalWithTagsRequestModel.fromJson(
      Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareProfessionalWithTagsMessage.fromJson(json['message'])
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

class HealthcareProfessionalWithTagsMessage {
  HealthcareProfessionalWithTagsIntent? intent;

  HealthcareProfessionalWithTagsMessage({this.intent});

  HealthcareProfessionalWithTagsMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareProfessionalWithTagsIntent.fromJson(json['intent'])
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

class HealthcareProfessionalWithTagsIntent {
  HealthcareProfessionalWithTagsCategory? category;
  HealthcareProfessionalWithTagsFulfillment? fulfillment;

  HealthcareProfessionalWithTagsIntent({this.category, this.fulfillment});

  HealthcareProfessionalWithTagsIntent.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new HealthcareProfessionalWithTagsCategory.fromJson(json['category'])
        : null;
    fulfillment = json['fulfillment'] != null
        ? new HealthcareProfessionalWithTagsFulfillment.fromJson(
            json['fulfillment'])
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

class HealthcareProfessionalWithTagsCategory {
  HealthcareProfessionalWithTagsDescriptor? descriptor;

  HealthcareProfessionalWithTagsCategory({this.descriptor});

  HealthcareProfessionalWithTagsCategory.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new HealthcareProfessionalWithTagsDescriptor.fromJson(
            json['descriptor'])
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

class HealthcareProfessionalWithTagsDescriptor {
  String? code;

  HealthcareProfessionalWithTagsDescriptor({this.code});

  HealthcareProfessionalWithTagsDescriptor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class HealthcareProfessionalWithTagsFulfillment {
  HealthcareProfessionalWithTagsPerson? person;

  HealthcareProfessionalWithTagsFulfillment({this.person});

  HealthcareProfessionalWithTagsFulfillment.fromJson(
      Map<String, dynamic> json) {
    person = json['person'] != null
        ? new HealthcareProfessionalWithTagsPerson.fromJson(json['person'])
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

class HealthcareProfessionalWithTagsPerson {
  HealthcareProfessionalWithTagsTags? tags;

  HealthcareProfessionalWithTagsPerson({this.tags});

  HealthcareProfessionalWithTagsPerson.fromJson(Map<String, dynamic> json) {
    tags = json['tags'] != null
        ? new HealthcareProfessionalWithTagsTags.fromJson(json['tags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    return data;
  }
}

class HealthcareProfessionalWithTagsTags {
  String? dhp071Exp;
  String? dhp071Lang;

  HealthcareProfessionalWithTagsTags({this.dhp071Exp, this.dhp071Lang});

  HealthcareProfessionalWithTagsTags.fromJson(Map<String, dynamic> json) {
    dhp071Exp = json['./dhp-0_7_1.exp'];
    dhp071Lang = json['./dhp-0_7_1.lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['./dhp-0_7_1.exp'] = this.dhp071Exp;
    data['./dhp-0_7_1.lang'] = this.dhp071Lang;
    return data;
  }
}
