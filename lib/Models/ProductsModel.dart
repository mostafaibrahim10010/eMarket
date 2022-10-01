/// data : [{"_id":"61ab420c0f34753bcedfa787","title":"special cotton shirt for men","price":15,"category":{"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"},"description":"","createdBy":{"role":"ROLE_CUSTOMER","_id":"612e49b9345dcc333ac6cb41","name":"Sofia Lily"},"createdAt":"2021-12-04T10:25:16.546Z","updatedAt":"2021-12-11T03:14:40.195Z","slug":"special-cotton-shirt-for-men","image":""},null]
/// status : 200
/// message : "Success"

class ProductsModel {
  ProductsModel({
      this.data, 
      this.status, 
      this.message,});

  ProductsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<Data>? data;
  num? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}

/// _id : "61ab420c0f34753bcedfa787"
/// title : "special cotton shirt for men"
/// price : 15
/// category : {"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"}
/// description : ""
/// createdBy : {"role":"ROLE_CUSTOMER","_id":"612e49b9345dcc333ac6cb41","name":"Sofia Lily"}
/// createdAt : "2021-12-04T10:25:16.546Z"
/// updatedAt : "2021-12-11T03:14:40.195Z"
/// slug : "special-cotton-shirt-for-men"
/// image : ""

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
      this.slug, 
      this.image,});

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
    image = json['image'];
  }
  String? id;
  String? title;
  num? price;
  Category? category;
  String? description;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? image;

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
    map['image'] = image;
    return map;
  }

}

/// role : "ROLE_CUSTOMER"
/// _id : "612e49b9345dcc333ac6cb41"
/// name : "Sofia Lily"

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

/// _id : "61ab1ca64a0fef3f27dc663f"
/// name : "men's fashion"
/// slug : "mens-fashion"

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