/// data : [{"products":["61ab420c0f34753bcedfa787","61ab42600f34753bcedfa78b","61ab42790f34753bcedfa78f"],"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"}]
/// status : 200
/// message : "Success"

class CategoryModel {
  CategoryModel({
      this.data, 
      this.status, 
      this.message,});

  CategoryModel.fromJson(dynamic json) {
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

/// products : ["61ab420c0f34753bcedfa787","61ab42600f34753bcedfa78b","61ab42790f34753bcedfa78f"]
/// _id : "61ab1ca64a0fef3f27dc663f"
/// name : "men's fashion"
/// slug : "mens-fashion"

class Data {
  Data({
      this.products, 
      this.id, 
      this.name, 
      this.slug,});

  Data.fromJson(dynamic json) {
    products = json['products'] != null ? json['products'].cast<String>() : [];
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }
  List<String>? products;
  String? id;
  String? name;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['products'] = products;
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }

}