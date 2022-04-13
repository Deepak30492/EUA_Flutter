class Fulfillments {
  String? id;
  String? type;
  Person? person;
  Start? start;
  Start? end;
  FulfillmentsTags? tags;

  Fulfillments(
      {this.id, this.type, this.person, this.start, this.end, this.tags});

  Fulfillments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    start = json['start'] != null ? new Start.fromJson(json['start']) : null;
    end = json['end'] != null ? new Start.fromJson(json['end']) : null;
    tags = json['tags'] != null
        ? new FulfillmentsTags.fromJson(json['tags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
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

class Person {
  String? id;
  String? name;
  String? gender;
  String? image;
  String? cred;

  Person({this.id, this.name, this.gender, this.image, this.cred});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    image = json['image'];
    cred = json['cred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['cred'] = this.cred;
    return data;
  }
}

class Start {
  Time? time;

  Start({this.time});

  Start.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    return data;
  }
}

class Time {
  String? timestamp;

  Time({this.timestamp});

  Time.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class FulfillmentsTags {
  String? speciality;

  FulfillmentsTags({this.speciality});

  FulfillmentsTags.fromJson(Map<String, dynamic> json) {
    speciality = json['speciality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speciality'] = this.speciality;
    return data;
  }
}
