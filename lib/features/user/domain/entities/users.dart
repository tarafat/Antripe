class Contact {
  String? id;
  String? name;
  String? phone;
  String? categoryId;
  String? avatarUrl;

  Contact({this.id, this.name, this.phone, this.categoryId, this.avatarUrl});

  Contact copyWith({String? id, String? name, String? phone, String? categoryId, String? avatarUrl}) => Contact(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    categoryId: categoryId ?? this.categoryId,
    avatarUrl: avatarUrl ?? this.avatarUrl,
  );

  factory Contact.fromJson(Map<String, dynamic> json) =>
      Contact(id: json["id"], name: json["name"], phone: json["phone"], categoryId: json["categoryId"], avatarUrl: json["avatarUrl"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "phone": phone, "categoryId": categoryId, "avatarUrl": avatarUrl};
}
