import 'package:uhi_eua_flutter_app/model/model.dart';

class BookingDetailsModel {
  BookingDetailsContext? context;
  BookingDetailsMessage? message;

  BookingDetailsModel({this.context, this.message});

  BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new BookingDetailsContext.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new BookingDetailsMessage.fromJson(json['message'])
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

class BookingDetailsContext {
  String? domain;
  String? country;
  String? city;
  String? action;
  String? coreVersion;
  String? transactionId;
  String? messageId;
  String? timestamp;

  BookingDetailsContext(
      {this.domain,
      this.country,
      this.city,
      this.action,
      this.coreVersion,
      this.transactionId,
      this.messageId,
      this.timestamp});

  BookingDetailsContext.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    country = json['country'];
    city = json['city'];
    action = json['action'];
    coreVersion = json['core_version'];
    transactionId = json['transaction_id'];
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
    data['transaction_id'] = this.transactionId;
    data['message_id'] = this.messageId;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class BookingDetailsMessage {
  BookingDetailsOrder? order;

  BookingDetailsMessage({this.order});

  BookingDetailsMessage.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null
        ? new BookingDetailsOrder.fromJson(json['order'])
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

class BookingDetailsOrder {
  String? id;
  Provider? provider;
  String? state;
  List<BookingDetailsOrderItems>? items;
  Billing? billing;
  Fulfillment? fulfillment;
  Quote? quote;
  Payment? payment;

  BookingDetailsOrder(
      {this.id,
      this.provider,
      this.state,
      this.items,
      this.billing,
      this.fulfillment,
      this.quote,
      this.payment});

  BookingDetailsOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    state = json['state'];
    if (json['items'] != null) {
      items = <BookingDetailsOrderItems>[];
      json['items'].forEach((v) {
        items!.add(new BookingDetailsOrderItems.fromJson(v));
      });
    }
    billing =
        json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    fulfillment = json['fulfillment'] != null
        ? new Fulfillment.fromJson(json['fulfillment'])
        : null;
    quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    data['state'] = this.state;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    if (this.fulfillment != null) {
      data['fulfillment'] = this.fulfillment!.toJson();
    }
    if (this.quote != null) {
      data['quote'] = this.quote!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    return data;
  }
}

class Provider {
  String? id;
  Descriptor? descriptor;

  Provider({this.id, this.descriptor});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new Descriptor.fromJson(json['descriptor'])
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

class Descriptor {
  String? name;

  Descriptor({this.name});

  Descriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class BookingDetailsOrderItems {
  String? id;
  Descriptor? descriptor;
  String? fulfillmentId;
  String? providerId;

  BookingDetailsOrderItems(
      {this.id, this.descriptor, this.fulfillmentId, this.providerId});

  BookingDetailsOrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new Descriptor.fromJson(json['descriptor'])
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

class Billing {
  String? name;
  Address? address;
  String? email;
  String? phone;

  Billing({this.name, this.address, this.email, this.phone});

  Billing.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Address {
  String? door;
  String? building;
  String? street;
  String? areaCode;

  Address({this.door, this.building, this.street, this.areaCode});

  Address.fromJson(Map<String, dynamic> json) {
    door = json['door'];
    building = json['building'];
    street = json['street'];
    areaCode = json['area_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['door'] = this.door;
    data['building'] = this.building;
    data['street'] = this.street;
    data['area_code'] = this.areaCode;
    return data;
  }
}

class Fulfillment {
  String? id;
  String? type;
  Person? person;
  BookingDetailsState? state;
  Time? time;
  Customer? customer;

  Fulfillment(
      {this.id, this.type, this.person, this.state, this.time, this.customer});

  Fulfillment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    state = json['state'] != null
        ? new BookingDetailsState.fromJson(json['state'])
        : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class BookingDetailsState {
  BookingDetailsStateDescriptor? descriptor;

  BookingDetailsState({this.descriptor});

  BookingDetailsState.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new BookingDetailsStateDescriptor.fromJson(json['descriptor'])
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

class BookingDetailsStateDescriptor {
  String? code;

  BookingDetailsStateDescriptor({this.code});

  BookingDetailsStateDescriptor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

// class BookingDetailsTime {
//   Range? range;

//   BookingDetailsTime({this.range});

//   BookingDetailsTime.fromJson(Map<String, dynamic> json) {
//     range = json['range'] != null ? new Range.fromJson(json['range']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.range != null) {
//       data['range'] = this.range!.toJson();
//     }
//     return data;
//   }
// }

// class Range {
//   String? start;
//   String? end;

//   Range({this.start, this.end});

//   Range.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['start'] = this.start;
//     data['end'] = this.end;
//     return data;
//   }
// }

class Customer {
  String? nhaHealthId;
  String? nhaPhrAddress;

  Customer({this.nhaHealthId, this.nhaPhrAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    nhaHealthId = json['./nha.health_id'];
    nhaPhrAddress = json['./nha.phr_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['./nha.health_id'] = this.nhaHealthId;
    data['./nha.phr_address'] = this.nhaPhrAddress;
    return data;
  }
}

// class Quote {
//   Price? price;

//   Quote({this.price});

//   Quote.fromJson(Map<String, dynamic> json) {
//     price = json['price'] != null ? new Price.fromJson(json['price']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.price != null) {
//       data['price'] = this.price!.toJson();
//     }
//     return data;
//   }
// }

// class Price {
//   String? currency;
//   String? value;
//   List<Breakup>? breakup;

//   Price({this.currency, this.value, this.breakup});

//   Price.fromJson(Map<String, dynamic> json) {
//     currency = json['currency'];
//     value = json['value'];
//     if (json['breakup'] != null) {
//       breakup = <Breakup>[];
//       json['breakup'].forEach((v) {
//         breakup!.add(new Breakup.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['currency'] = this.currency;
//     data['value'] = this.value;
//     if (this.breakup != null) {
//       data['breakup'] = this.breakup!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Breakup {
//   String? dhp071Consultation;
//   String? dhp071PhrHandlingFees;
//   String? indGstinCgst;
//   String? indGstinSgst;

//   Breakup(
//       {this.dhp071Consultation,
//       this.dhp071PhrHandlingFees,
//       this.indGstinCgst,
//       this.indGstinSgst});

//   Breakup.fromJson(Map<String, dynamic> json) {
//     dhp071Consultation = json['./dhp-0_7_1.consultation'];
//     dhp071PhrHandlingFees = json['./dhp-0_7_1.phr_handling_fees'];
//     indGstinCgst = json['./ind-gstin.cgst'];
//     indGstinSgst = json['./ind-gstin.sgst'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['./dhp-0_7_1.consultation'] = this.dhp071Consultation;
//     data['./dhp-0_7_1.phr_handling_fees'] = this.dhp071PhrHandlingFees;
//     data['./ind-gstin.cgst'] = this.indGstinCgst;
//     data['./ind-gstin.sgst'] = this.indGstinSgst;
//     return data;
//   }
// }

class Payment {
  String? uri;
  String? type;
  String? status;

  Payment({this.uri, this.type, this.status});

  Payment.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}
