import 'package:uhi_eua_flutter_app/model/model.dart';

class HealthcareServiceProviderNameRequestModel {
  ContextModel? context;
  HealthcareServiceProviderNameMessage? message;

  HealthcareServiceProviderNameRequestModel({this.context, this.message});

  HealthcareServiceProviderNameRequestModel.fromJson(
      Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new HealthcareServiceProviderNameMessage.fromJson(json['message'])
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

class HealthcareServiceProviderNameMessage {
  HealthcareServiceProviderNameIntent? intent;

  HealthcareServiceProviderNameMessage({this.intent});

  HealthcareServiceProviderNameMessage.fromJson(Map<String, dynamic> json) {
    intent = json['intent'] != null
        ? new HealthcareServiceProviderNameIntent.fromJson(json['intent'])
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

class HealthcareServiceProviderNameIntent {
  HealthcareServiceProviderNameProvider? provider;

  HealthcareServiceProviderNameIntent({this.provider});

  HealthcareServiceProviderNameIntent.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? new HealthcareServiceProviderNameProvider.fromJson(json['provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    return data;
  }
}

class HealthcareServiceProviderNameProvider {
  HealthcareServiceProviderNameDescriptor? descriptor;

  HealthcareServiceProviderNameProvider({this.descriptor});

  HealthcareServiceProviderNameProvider.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new HealthcareServiceProviderNameDescriptor.fromJson(
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

class HealthcareServiceProviderNameDescriptor {
  String? name;

  HealthcareServiceProviderNameDescriptor({this.name});

  HealthcareServiceProviderNameDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
