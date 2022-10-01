/// status : 200
/// data : {"_id":"61ab431c0f34753bcedfa7a6","title":"running sneaker","price":200,"category":{"_id":"61ab1d0e4a0fef3f27dc664d","name":"bags & shoes","slug":"bags-and-shoes"},"description":null,"createdBy":{"role":"ROLE_CUSTOMER","_id":"612e4851345dcc333ac6cb24","name":"Robert Gonzalez"},"createdAt":"2021-12-04T10:29:48.295Z","updatedAt":"2021-12-04T10:29:48.295Z","slug":"running-sneaker"}
/// message : "Success! Product found"

class ProductDetailsModel {
  ProductDetailsModel({
      this.status, 
      this.data, 
      this.message,});

  ProductDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  num? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

/// _id : "61ab431c0f34753bcedfa7a6"
/// title : "running sneaker"
/// price : 200
/// category : {"_id":"61ab1d0e4a0fef3f27dc664d","name":"bags & shoes","slug":"bags-and-shoes"}
/// description : null
/// createdBy : {"role":"ROLE_CUSTOMER","_id":"612e4851345dcc333ac6cb24","name":"Robert Gonzalez"}
/// createdAt : "2021-12-04T10:29:48.295Z"
/// updatedAt : "2021-12-04T10:29:48.295Z"
/// slug : "running-sneaker"

class Data {
  Data({
      this.id, 
      this.title, 
      this.price, 
      this.category, 
      this.description, 
      this.createdBy, 
      this.createdAt, 
      this.updatedAt, 
      this.slug,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    description = json['description'];
    createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
  }
  String? id;
  String? title;
  num? price;
  Category? category;
  dynamic description;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['price'] = price;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['description'] = description;
    if (createdBy != null) {
      map['createdBy'] = createdBy?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['slug'] = slug;
    return map;
  }

}

/// role : "ROLE_CUSTOMER"
/// _id : "612e4851345dcc333ac6cb24"
/// name : "Robert Gonzalez"

class CreatedBy {
  CreatedBy({
      this.role, 
      this.id, 
      this.name,});

  CreatedBy.fromJson(dynamic json) {
    role = json['role'];
    id = json['_id'];
    name = json['name'];
  }
  String? role;
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['_id'] = id;
    map['name'] = name;
    return map;
  }

}

/// _id : "61ab1d0e4a0fef3f27dc664d"
/// name : "bags & shoes"
/// slug : "bags-and-shoes"

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }
  String? id;
  String? name;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }

}