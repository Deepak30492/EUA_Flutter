import 'package:uhi_eua_flutter_app/model/model.dart';

class FulfillmentDetailsRequestModel {
  ContextModel? context;
  FulfillmentDetailsRequestMessage? message;

  FulfillmentDetailsRequestModel({this.context, this.message});

  FulfillmentDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new FulfillmentDetailsRequestMessage.fromJson(json['message'])
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

class FulfillmentDetailsRequestMessage {
  FulfillmentDetailsRequestOrder? order;

  FulfillmentDetailsRequestMessage({this.order});

  FulfillmentDetailsRequestMessage.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null
        ? new FulfillmentDetailsRequestOrder.fromJson(json['order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class FulfillmentDetailsRequestOrder {
  FulfillmentDetailsRequestProvider? provider;
  List<FulfillmentDetailsRequestItems>? items;

  FulfillmentDetailsRequestOrder({this.provider, this.items});

  FulfillmentDetailsRequestOrder.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? new FulfillmentDetailsRequestProvider.fromJson(json['provider'])
        : null;
    if (json['items'] != null) {
      items = <FulfillmentDetailsRequestItems>[];
      json['items'].forEach((v) {
        items!.add(new FulfillmentDetailsRequestItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FulfillmentDetailsRequestProvider {
  String? id;

  FulfillmentDetailsRequestProvider({this.id});

  FulfillmentDetailsRequestProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class FulfillmentDetailsRequestItems {
  String? id;
  String? fulfillmentId;

  FulfillmentDetailsRequestItems({this.id, this.fulfillmentId});

  FulfillmentDetailsRequestItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fulfillmentId = json['fulfillment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fulfillment_id'] = this.fulfillmentId;
    return data;
  }
}
