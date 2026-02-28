import 'dart:convert';

class ContractResponse {
  String? status;
  String? message;
  Data? data;

  ContractResponse({this.status, this.message, this.data});

  ContractResponse copyWith({String? status, String? message, Data? data}) =>
      ContractResponse(status: status ?? this.status, message: message ?? this.message, data: data ?? this.data);

  factory ContractResponse.fromRawJson(String str) => ContractResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContractResponse.fromJson(Map<String, dynamic> json) =>
      ContractResponse(status: json["status"], message: json["message"], data: json["data"] == null ? null : Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"status": status, "message": message, "data": data?.toJson()};
}

class Data {
  List<Category>? categories;
  List<Contact>? contacts;

  Data({this.categories, this.contacts});

  Data copyWith({List<Category>? categories, List<Contact>? contacts}) =>
      Data(categories: categories ?? this.categories, contacts: contacts ?? this.contacts);

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category copyWith({String? id, String? name}) => Category(id: id ?? this.id, name: name ?? this.name);

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Contact {
  String? id;
  bool? isEmpty;
  String? name;
  String? phone;
  String? categoryId;
  String? avatarUrl;
  String? subtitle;
  String? status;
  DateTime? createdAt;

  Contact({this.id, this.isEmpty, this.name, this.phone, this.categoryId, this.avatarUrl, this.subtitle, this.status, this.createdAt});

  Contact copyWith({
    String? id,
    bool? isEmpty,
    String? name,
    String? phone,
    String? categoryId,
    String? avatarUrl,
    String? subtitle,
    String? status,
    DateTime? createdAt,
  }) => Contact(
    id: id ?? this.id,
    isEmpty: isEmpty ?? this.isEmpty,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    categoryId: categoryId ?? this.categoryId,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    subtitle: subtitle ?? this.subtitle,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    isEmpty: json["isEmpty"],
    name: json["name"],
    phone: json["phone"],
    categoryId: json["categoryId"],
    avatarUrl: json["avatarUrl"],
    subtitle: json["subtitle"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isEmpty": isEmpty,
    "name": name,
    "phone": phone,
    "categoryId": categoryId,
    "avatarUrl": avatarUrl,
    "subtitle": subtitle,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}
