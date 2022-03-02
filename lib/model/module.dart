import 'dart:convert';

Module moduleFromJson(String str) => Module.fromJson(json.decode(str));

String moduleToJson(Module data) => json.encode(data.toJson());

class Module {
  Module({
    required this.version,
    required this.courseId,
    required this.name,
    required this.description,
    required this.image,
    required this.id,
    required this.v,
  });

  final double version;
  final String courseId;
  final String name;
  final String description;
  final String image;
  final String id;
  final int v;

  Module copyWith({
    double? version,
    String? courseId,
    String? name,
    String? description,
    String? image,
    String? id,
    int? v,
  }) =>
      Module(
        version: version ?? this.version,
        courseId: courseId ?? this.courseId,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        version: json["version"],
        courseId: json["courseId"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "courseId": courseId,
        "name": name,
        "description": description,
        "image": image,
        "_id": id,
        "__v": v,
      };
}
