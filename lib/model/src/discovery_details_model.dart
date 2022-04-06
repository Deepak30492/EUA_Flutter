import 'package:uhi_eua_flutter_app/model/model.dart';

class DiscoveryDetailsModel {
  ContextModel? context;
  Message? message;

  DiscoveryDetailsModel({this.context, this.message});

  DiscoveryDetailsModel.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null
        ? new ContextModel.fromJson(json['context'])
        : null;
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
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

class Message {
  Catalog? catalog;

  Message({this.catalog});

  Message.fromJson(Map<String, dynamic> json) {
    catalog =
        json['catalog'] != null ? new Catalog.fromJson(json['catalog']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.catalog != null) {
      data['catalog'] = this.catalog!.toJson();
    }
    return data;
  }
}

class Catalog {
  Descriptor? descriptor;
  List<Providers>? providers;

  Catalog({this.descriptor, this.providers});

  Catalog.fromJson(Map<String, dynamic> json) {
    descriptor = json['descriptor'] != null
        ? new Descriptor.fromJson(json['descriptor'])
        : null;
    if (json['providers'] != null) {
      providers = <Providers>[];
      json['providers'].forEach((v) {
        providers!.add(new Providers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    if (this.providers != null) {
      data['providers'] = this.providers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorDetailsDescriptor {
  String? name;

  DoctorDetailsDescriptor({this.name});

  DoctorDetailsDescriptor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Providers {
  String? id;
  Descriptor? descriptor;
  List<Categories>? categories;
  List<Fulfillments>? fulfillments;
  List<Items>? items;

  Providers(
      {this.id,
      this.descriptor,
      this.categories,
      this.fulfillments,
      this.items});

  Providers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new Descriptor.fromJson(json['descriptor'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillments>[];
      json['fulfillments'].forEach((v) {
        fulfillments!.add(new Fulfillments.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.fulfillments != null) {
      data['fulfillments'] = this.fulfillments!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  Descriptor? descriptor;

  Categories({this.id, this.descriptor});

  Categories.fromJson(Map<String, dynamic> json) {
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

class Items {
  String? id;
  Descriptor? descriptor;
  String? categoryId;
  String? fulfillmentId;

  Items({this.id, this.descriptor, this.categoryId, this.fulfillmentId});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptor = json['descriptor'] != null
        ? new Descriptor.fromJson(json['descriptor'])
        : null;
    categoryId = json['category_id'];
    fulfillmentId = json['fulfillment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.descriptor != null) {
      data['descriptor'] = this.descriptor!.toJson();
    }
    data['category_id'] = this.categoryId;
    data['fulfillment_id'] = this.fulfillmentId;
    return data;
  }
}
