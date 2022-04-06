class BookingDetailsRequestModel {
  BookingDetailsRequestContext? context;
  BookingDetailsRequestMessage? message;

  BookingDetailsRequestModel({this.context, this.message});

  BookingDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new BookingDetailsRequestContext.fromJson(json['context'])
        : null;
    message = json['message'] != null
        ? new BookingDetailsRequestMessage.fromJson(json['message'])
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

class BookingDetailsRequestContext {
  String? domain;
  String? country;
  String? city;
  String? action;
  String? coreVersion;
  String? consumerId;
  String? providerId;
  String? providerUri;
  String? transactionId;
  String? messageId;
  String? timestamp;
  String? key;
  String? ttl;
  String? consumerUri;

  BookingDetailsRequestContext(
      {this.domain,
      this.country,
      this.city,
      this.action,
      this.coreVersion,
      this.consumerId,
      this.providerId,
      this.providerUri,
      this.transactionId,
      this.messageId,
      this.timestamp,
      this.key,
      this.ttl,
      this.consumerUri});

  BookingDetailsRequestContext.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    country = json['country'];
    city = json['city'];
    action = json['action'];
    coreVersion = json['core_version'];
    consumerId = json['consumer_id'];
    providerId = json['provider_id'];
    providerUri = json['provider_uri'];
    transactionId = json['transaction_id'];
    messageId = json['message_id'];
    timestamp = json['timestamp'];
    key = json['key'];
    ttl = json['ttl'];
    consumerUri = json['consumer_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domain'] = this.domain;
    data['country'] = this.country;
    data['city'] = this.city;
    data['action'] = this.action;
    data['core_version'] = this.coreVersion;
    data['consumer_id'] = this.consumerId;
    data['provider_id'] = this.providerId;
    data['provider_uri'] = this.providerUri;
    data['transaction_id'] = this.transactionId;
    data['message_id'] = this.messageId;
    data['timestamp'] = this.timestamp;
    data['key'] = this.key;
    data['ttl'] = this.ttl;
    data['consumer_uri'] = this.consumerUri;
    return data;
  }
}

class BookingDetailsRequestMessage {
  BookingDetailsRequestOrder? order;

  BookingDetailsRequestMessage({this.order});

  BookingDetailsRequestMessage.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null
        ? new BookingDetailsRequestOrder.fromJson(json['order'])
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

class BookingDetailsRequestOrder {
  BookingDetailsRequestProvider? provider;
  BookingDetailsRequestState? state;
  List<BookingDetailsRequestItems>? items;
  BookingDetailsRequestBilling? billing;
  BookingDetailsRequestFulfillment? fulfillment;

  BookingDetailsRequestOrder(
      {this.provider, this.state, this.items, this.billing, this.fulfillment});

  BookingDetailsRequestOrder.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? new BookingDetailsRequestProvider.fromJson(json['provider'])
        : null;
    state = json['state'] != null
        ? new BookingDetailsRequestState.fromJson(json['state'])
        : null;
    if (json['items'] != null) {
      items = <BookingDetailsRequestItems>[];
      json['items'].forEach((v) {
        items!.add(new BookingDetailsRequestItems.fromJson(v));
      });
    }
    billing = json['billing'] != null
        ? new BookingDetailsRequestBilling.fromJson(json['billing'])
        : null;
    fulfillment = json['fulfillment'] != null
        ? new BookingDetailsRequestFulfillment.fromJson(json['fulfillment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    if (this.fulfillment != null) {
      data['fulfillment'] = this.fulfillment!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestProvider {
  String? id;

  BookingDetailsRequestProvider({this.id});

  BookingDetailsRequestProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class BookingDetailsRequestState {
  BookingDetailsRequestStateDescriptor? descriptor;
  String? updatedAt;
  String? updatedBy;

  BookingDetailsRequestState({this.descriptor, this.updatedAt, this.updatedBy});

  BookingDetailsRequestState.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new BookingDetailsRequestStateDescriptor.fromJson(json['descriptor'])
        : null;
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

class BookingDetailsRequestStateDescriptor {
  String? name;
  String? code;
  String? symbol;
  String? shortDesc;
  String? longDesc;
  List<String>? images;
  String? audio;
  String? s3dRender;

  BookingDetailsRequestStateDescriptor(
      {this.name,
      this.code,
      this.symbol,
      this.shortDesc,
      this.longDesc,
      this.images,
      this.audio,
      this.s3dRender});

  BookingDetailsRequestStateDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    shortDesc = json['short_desc'];
    longDesc = json['long_desc'];
    images = json['images'].cast<String>();
    audio = json['audio'];
    s3dRender = json['3d_render'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['short_desc'] = this.shortDesc;
    data['long_desc'] = this.longDesc;
    data['images'] = this.images;
    data['audio'] = this.audio;
    data['3d_render'] = this.s3dRender;
    return data;
  }
}

class BookingDetailsRequestItems {
  String? id;
  BookingDetailsRequestQuantity? quantity;
  String? fulfillmentId;

  BookingDetailsRequestItems({this.id, this.quantity, this.fulfillmentId});

  BookingDetailsRequestItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'] != null
        ? new BookingDetailsRequestQuantity.fromJson(json['quantity'])
        : null;
    fulfillmentId = json['fulfillment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.quantity != null) {
      data['quantity'] = this.quantity!.toJson();
    }
    data['fulfillment_id'] = this.fulfillmentId;
    return data;
  }
}

class BookingDetailsRequestQuantity {
  int? count;
  BookingDetailsRequestMeasure? measure;

  BookingDetailsRequestQuantity({this.count, this.measure});

  BookingDetailsRequestQuantity.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    measure = json['measure'] != null
        ? new BookingDetailsRequestMeasure.fromJson(json['measure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.measure != null) {
      data['measure'] = this.measure!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestMeasure {
  String? type;
  int? value;
  int? estimatedValue;
  int? computedValue;
  BookingDetailsRequestMeasureRange? range;
  String? unit;

  BookingDetailsRequestMeasure(
      {this.type,
      this.value,
      this.estimatedValue,
      this.computedValue,
      this.range,
      this.unit});

  BookingDetailsRequestMeasure.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    estimatedValue = json['estimated_value'];
    computedValue = json['computed_value'];
    range = json['range'] != null
        ? new BookingDetailsRequestMeasureRange.fromJson(json['range'])
        : null;
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['estimated_value'] = this.estimatedValue;
    data['computed_value'] = this.computedValue;
    if (this.range != null) {
      data['range'] = this.range!.toJson();
    }
    data['unit'] = this.unit;
    return data;
  }
}

class BookingDetailsRequestMeasureRange {
  int? min;
  int? max;

  BookingDetailsRequestMeasureRange({this.min, this.max});

  BookingDetailsRequestMeasureRange.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class BookingDetailsRequestBilling {
  String? name;
  BookingDetailsRequestBillingOrganization? organization;
  BookingDetailsRequestBillingAddress? address;
  String? email;
  String? phone;
  BookingDetailsRequestBillingTime? time;
  String? taxNumber;
  String? createdAt;
  String? updatedAt;

  BookingDetailsRequestBilling(
      {this.name,
      this.organization,
      this.address,
      this.email,
      this.phone,
      this.time,
      this.taxNumber,
      this.createdAt,
      this.updatedAt});

  BookingDetailsRequestBilling.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    organization = json['organization'] != null
        ? new BookingDetailsRequestBillingOrganization.fromJson(
            json['organization'])
        : null;
    address = json['address'] != null
        ? new BookingDetailsRequestBillingAddress.fromJson(json['address'])
        : null;
    email = json['email'];
    phone = json['phone'];
    time = json['time'] != null
        ? new BookingDetailsRequestBillingTime.fromJson(json['time'])
        : null;
    taxNumber = json['tax_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    data['tax_number'] = this.taxNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BookingDetailsRequestBillingOrganization {
  String? name;
  String? cred;

  BookingDetailsRequestBillingOrganization({this.name, this.cred});

  BookingDetailsRequestBillingOrganization.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cred = json['cred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cred'] = this.cred;
    return data;
  }
}

class BookingDetailsRequestBillingAddress {
  String? door;
  String? name;
  String? building;
  String? street;
  String? locality;
  String? ward;
  String? city;
  String? state;
  String? country;
  String? areaCode;

  BookingDetailsRequestBillingAddress(
      {this.door,
      this.name,
      this.building,
      this.street,
      this.locality,
      this.ward,
      this.city,
      this.state,
      this.country,
      this.areaCode});

  BookingDetailsRequestBillingAddress.fromJson(Map<String, dynamic> json) {
    door = json['door'];
    name = json['name'];
    building = json['building'];
    street = json['street'];
    locality = json['locality'];
    ward = json['ward'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    areaCode = json['area_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['door'] = this.door;
    data['name'] = this.name;
    data['building'] = this.building;
    data['street'] = this.street;
    data['locality'] = this.locality;
    data['ward'] = this.ward;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['area_code'] = this.areaCode;
    return data;
  }
}

class BookingDetailsRequestBillingTime {
  String? label;
  String? timestamp;
  String? duration;
  BookingDetailsRequestBillingTimeRange? range;
  String? days;
  BookingDetailsRequestBillingTimeSchedule? schedule;

  BookingDetailsRequestBillingTime(
      {this.label,
      this.timestamp,
      this.duration,
      this.range,
      this.days,
      this.schedule});

  BookingDetailsRequestBillingTime.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    timestamp = json['timestamp'];
    duration = json['duration'];
    range = json['range'] != null
        ? new BookingDetailsRequestBillingTimeRange.fromJson(json['range'])
        : null;
    days = json['days'];
    schedule = json['schedule'] != null
        ? new BookingDetailsRequestBillingTimeSchedule.fromJson(
            json['schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['timestamp'] = this.timestamp;
    data['duration'] = this.duration;
    if (this.range != null) {
      data['range'] = this.range!.toJson();
    }
    data['days'] = this.days;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestBillingTimeRange {
  String? start;
  String? end;

  BookingDetailsRequestBillingTimeRange({this.start, this.end});

  BookingDetailsRequestBillingTimeRange.fromJson(Map<String, dynamic> json) {
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

class BookingDetailsRequestBillingTimeSchedule {
  String? frequency;
  List<String>? holidays;
  List<String>? times;

  BookingDetailsRequestBillingTimeSchedule(
      {this.frequency, this.holidays, this.times});

  BookingDetailsRequestBillingTimeSchedule.fromJson(Map<String, dynamic> json) {
    frequency = json['frequency'];
    holidays = json['holidays'].cast<String>();
    times = json['times'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frequency'] = this.frequency;
    data['holidays'] = this.holidays;
    data['times'] = this.times;
    return data;
  }
}

class BookingDetailsRequestFulfillment {
  String? id;
  String? type;
  String? providerId;
  BookingDetailsRequestState? state;
  bool? tracking;
  BookingDetailsRequestFulfillmentCustomer? customer;
  BookingDetailsRequestFulfillmentPerson? person;
  BookingDetailsRequestFulfillmentStart? start;
  BookingDetailsRequestFulfillmentStart? end;
  BookingDetailsRequestFulfillmentTags? tags;

  BookingDetailsRequestFulfillment(
      {this.id,
      this.type,
      this.providerId,
      this.state,
      this.tracking,
      this.customer,
      this.person,
      this.start,
      this.end,
      this.tags});

  BookingDetailsRequestFulfillment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    providerId = json['provider_id'];
    state = json['state'] != null
        ? new BookingDetailsRequestState.fromJson(json['state'])
        : null;
    tracking = json['tracking'];
    customer = json['customer'] != null
        ? new BookingDetailsRequestFulfillmentCustomer.fromJson(
            json['customer'])
        : null;
    person = json['person'] != null
        ? new BookingDetailsRequestFulfillmentPerson.fromJson(json['person'])
        : null;
    start = json['start'] != null
        ? new BookingDetailsRequestFulfillmentStart.fromJson(json['start'])
        : null;
    end = json['end'] != null
        ? new BookingDetailsRequestFulfillmentStart.fromJson(json['end'])
        : null;
    tags = json['tags'] != null
        ? new BookingDetailsRequestFulfillmentTags.fromJson(json['tags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['provider_id'] = this.providerId;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['tracking'] = this.tracking;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.start != null) {
      data['start'] = this.start!.toJson();
    }
    if (this.end != null) {
      data['end'] = this.end!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestFulfillmentCustomer {
  BookingDetailsRequestFulfillmentCustomerPerson? person;
  BookingDetailsRequestFulfillmentCustomerContact? contact;

  BookingDetailsRequestFulfillmentCustomer({this.person, this.contact});

  BookingDetailsRequestFulfillmentCustomer.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null
        ? new BookingDetailsRequestFulfillmentCustomerPerson.fromJson(
            json['person'])
        : null;
    contact = json['contact'] != null
        ? new BookingDetailsRequestFulfillmentCustomerContact.fromJson(
            json['contact'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestFulfillmentCustomerPerson {
  String? id;
  String? name;
  String? image;
  String? dob;
  String? gender;
  String? cred;
  BookingDetailsRequestFulfillmentTags? tags;

  BookingDetailsRequestFulfillmentCustomerPerson(
      {this.id,
      this.name,
      this.image,
      this.dob,
      this.gender,
      this.cred,
      this.tags});

  BookingDetailsRequestFulfillmentCustomerPerson.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dob = json['dob'];
    gender = json['gender'];
    cred = json['cred'];
    tags = json['tags'] != null
        ? new BookingDetailsRequestFulfillmentTags.fromJson(json['tags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['cred'] = this.cred;
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestFulfillmentTags {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  BookingDetailsRequestFulfillmentTags(
      {this.additionalProp1, this.additionalProp2, this.additionalProp3});

  BookingDetailsRequestFulfillmentTags.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}

class BookingDetailsRequestFulfillmentCustomerContact {
  String? phone;
  String? email;
  BookingDetailsRequestFulfillmentTags? tags;

  BookingDetailsRequestFulfillmentCustomerContact(
      {this.phone, this.email, this.tags});

  BookingDetailsRequestFulfillmentCustomerContact.fromJson(
      Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    tags = json['tags'] != null
        ? new BookingDetailsRequestFulfillmentTags.fromJson(json['tags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    return data;
  }
}

class BookingDetailsRequestFulfillmentPerson {
  String? id;
  String? name;
  String? image;
  String? dob;
  String? gender;
  String? cred;
  BookingDetailsRequestFulfillmentTags? tags;
  String? phone;
  String? email;

  BookingDetailsRequestFulfillmentPerson(
      {this.id,
      this.name,
      this.image,
      this.dob,
      this.gender,
      this.cred,
      this.tags,
      this.phone,
      this.email});

  BookingDetailsRequestFulfillmentPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dob = json['dob'];
    gender = json['gender'];
    cred = json['cred'];
    tags = json['tags'] != null
        ? new BookingDetailsRequestFulfillmentTags.fromJson(json['tags'])
        : null;
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['cred'] = this.cred;
    if (this.tags != null) {
      data['tags'] = this.tags!.toJson();
    }
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class BookingDetailsRequestFulfillmentStart {
  BookingDetailsRequestBillingTime? time;
  BookingDetailsRequestStateDescriptor? instructions;
  BookingDetailsRequestFulfillmentCustomerContact? contact;
  BookingDetailsRequestFulfillmentCustomerPerson? person;

  BookingDetailsRequestFulfillmentStart(
      {this.time, this.instructions, this.contact, this.person});

  BookingDetailsRequestFulfillmentStart.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null
        ? new BookingDetailsRequestBillingTime.fromJson(json['time'])
        : null;
    instructions = json['instructions'] != null
        ? new BookingDetailsRequestStateDescriptor.fromJson(
            json['instructions'])
        : null;
    contact = json['contact'] != null
        ? new BookingDetailsRequestFulfillmentCustomerContact.fromJson(
            json['contact'])
        : null;
    person = json['person'] != null
        ? new BookingDetailsRequestFulfillmentCustomerPerson.fromJson(
            json['person'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    return data;
  }
}
