import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareServiceNameRequestModel {
  ContextModel? context;
  HealthcareServiceNameMessage? message;

  HealthcareServiceNameRequestModel({this.context, this.message});

  HealthcareServiceNameRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareServiceNameMessage.fromJson(json['message'])
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

class HealthcareServiceNameMessage {
  HealthcareServiceNameIntent? intent;

  HealthcareServiceNameMessage({this.intent});

  HealthcareServiceNameMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareServiceNameIntent.fromJson(json['intent'])
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

class HealthcareServiceNameIntent {
  HealthcareServiceNameItem? item;

  HealthcareServiceNameIntent({this.item});

  HealthcareServiceNameIntent.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null
        ? new HealthcareServiceNameItem.fromJson(json['item'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class HealthcareServiceNameItem {
  HealthcareServiceNameDescriptor? descriptor;

  HealthcareServiceNameItem({this.descriptor});

  HealthcareServiceNameItem.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new HealthcareServiceNameDescriptor.fromJson(json['descriptor'])
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

class HealthcareServiceNameDescriptor {
  String? name;

  HealthcareServiceNameDescriptor({this.name});

  HealthcareServiceNameDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
