class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category copyWith({String? id, String? name}) => Category(id: id ?? this.id, name: name ?? this.name);

  factory Category.fromJson(Map<String, dynamic> json) => Category(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
