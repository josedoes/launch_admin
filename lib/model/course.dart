import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    required this.id,
    required this.version,
    required this.name,
    required this.image,
    required this.published,
  });

  final String id;
  final double version;
  final String name;
  final String image;
  final bool published;

  Course copyWith({
    String? id,
    double? version,
    String? name,
    String? image,
    bool? published,
  }) =>
      Course(
        id: id ?? this.id,
        version: version ?? this.version,
        name: name ?? this.name,
        image: image ?? this.image,
        published: published ?? this.published,
      );

  factory Course.fromJson(json) => Course(
        id: json["_id"],
        version: json["version"],
        name: json["name"],
        image: json["image"],
        published: json["published"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "version": version,
        "name": name,
        "image": image,
        "published": published,
      };
}
