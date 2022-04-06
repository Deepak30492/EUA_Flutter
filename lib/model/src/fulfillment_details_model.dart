import 'package:uhi_eua_flutter_app/model/model.dart';

class FulfillmentDetailsModel {
  FulfillmentDetailsContext? context;
  FulfillmentDetailsMessage? message;

  FulfillmentDetailsModel({this.context, this.message});

  FulfillmentDetailsModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new FulfillmentDetailsContext.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new FulfillmentDetailsMessage.fromJson(json['message'])
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

class FulfillmentDetailsContext {
  String? domain;
  String? country;
  String? city;
  String? action;
  String? coreVersion;
  String? messageId;
  String? timestamp;

  FulfillmentDetailsContext(
      {this.domain,
      this.country,
      this.city,
      this.action,
      this.coreVersion,
      this.messageId,
      this.timestamp});

  FulfillmentDetailsContext.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    country = json['country'];
    city = json['city'];
    action = json['action'];
    coreVersion = json['core_version'];
    messageId = json['message_id'];
    timestamp = json['timestamp'];
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
    return data;
  }
}

class FulfillmentDetailsMessage {
  Order? order;

  FulfillmentDetailsMessage({this.order});

  FulfillmentDetailsMessage.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  FulfillmentDetailsProvider? provider;
  List<OrderItems>? items;
  FulfillmentDetailsFulfillment? fulfillment;
  Quote? quote;

  Order({this.provider, this.items, this.fulfillment, this.quote});

  Order.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? new FulfillmentDetailsProvider.fromJson(json['provider'])
        : null;
    if (json['items'] != null) {
      items = <OrderItems>[];
      json['items'].forEach((v) {
        items!.add(new OrderItems.fromJson(v));
      });
    }
    fulfillment = json['fulfillment'] != null
        ? new FulfillmentDetailsFulfillment.fromJson(json['fulfillment'])
        : null;
    quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.fulfillment != null) {
      data['fulfillment'] = this.fulfillment!.toJson();
    }
    if (this.quote != null) {
      data['quote'] = this.quote!.toJson();
    }
    return data;
  }
}

class FulfillmentDetailsProvider {
  String? id;
  FulfillmentDetailsProviderDescriptor? descriptor;

  FulfillmentDetailsProvider({this.id, this.descriptor});

  FulfillmentDetailsProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new FulfillmentDetailsProviderDescriptor.fromJson(json['descriptor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    return data;
  }
}

class FulfillmentDetailsProviderDescriptor {
  String? name;

  FulfillmentDetailsProviderDescriptor({this.name});

  FulfillmentDetailsProviderDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class OrderItems {
  String? id;
  FulfillmentDetailsProviderDescriptor? descriptor;
  String? fulfillmentId;
  String? providerId;

  OrderItems({this.id, this.descriptor, this.fulfillmentId, this.providerId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new FulfillmentDetailsProviderDescriptor.fromJson(json['descriptor'])
        : null;
    fulfillmentId = json['fulfillment_id'];
    providerId = json['provider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    data['fulfillment_id'] = this.fulfillmentId;
    data['provider_id'] = this.providerId;
    return data;
  }
}

class FulfillmentDetailsFulfillment {
  String? id;
  String? type;
  Person? person;
  FulfillmentTime? time;

  FulfillmentDetailsFulfillment({this.id, this.type, this.person, this.time});

  FulfillmentDetailsFulfillment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    time = json['time'] != null
        ? new FulfillmentTime.fromJson(json['time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    return data;
  }
}

class FulfillmentTime {
  Range? range;

  FulfillmentTime({this.range});

  FulfillmentTime.fromJson(Map<String, dynamic> json) {
    range = json['range'] != null ? new Range.fromJson(json['range']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.range != null) {
      data['range'] = this.range!.toJson();
    }
    return data;
  }
}

class Range {
  String? start;
  String? end;

  Range({this.start, this.end});

  Range.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Quote {
  Price? price;

  Quote({this.price});

  Quote.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Price {
  String? currency;
  String? value;
  List<Breakup>? breakup;

  Price({this.currency, this.value, this.breakup});

  Price.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value = json['value'];
    if (json['breakup'] != null) {
      breakup = <Breakup>[];
      json['breakup'].forEach((v) {
        breakup!.add(new Breakup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['value'] = this.value;
    if (this.breakup != null) {
      data['breakup'] = this.breakup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breakup {
  String? dhp071Consultation;
  String? dhp071Cgst;
  String? dhp071Sgst;

  Breakup({this.dhp071Consultation, this.dhp071Cgst, this.dhp071Sgst});

  Breakup.fromJson(Map<String, dynamic> json) {
    dhp071Consultation = json['./dhp-0_7_1.consultation'];
    dhp071Cgst = json['./dhp-0_7_1.cgst'];
    dhp071Sgst = json['./dhp-0_7_1.sgst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['./dhp-0_7_1.consultation'] = this.dhp071Consultation;
    data['./dhp-0_7_1.cgst'] = this.dhp071Cgst;
    data['./dhp-0_7_1.sgst'] = this.dhp071Sgst;
    return data;
  }
}
