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
    required this.shortDescription,
    required this.midDescription,
    required this.longDescription,
    required this.sortWeight,
  });

  final String shortDescription;
  final String midDescription;
  final String longDescription;

  final int sortWeight;
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
    String? shortDescription,
    String? midDescription,
    String? longDescription,
    bool? published,
    int? sortWeight,
  }) =>
      Course(
        id: id ?? this.id,
        sortWeight: sortWeight ?? this.sortWeight,
        version: version ?? this.version,
        name: name ?? this.name,
        image: image ?? this.image,
        published: published ?? this.published,
        shortDescription: shortDescription ?? this.shortDescription,
        midDescription: midDescription ?? this.midDescription,
        longDescription: longDescription ?? this.longDescription,
      );

  factory Course.fromJson(json) => Course(
        id: json["_id"],
        version: json["version"],
        name: json["name"],
        image: json["image"],
        published: json["published"] ?? true,
        shortDescription: json['shortDescription'] ?? '',
        midDescription: json['midDescription'] ?? '',
        longDescription: json['longDescription'] ?? '',
        sortWeight: json['sortWeight'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "version": version,
        "name": name,
        "image": image,
        "published": published,
        'shortDescription': shortDescription,
        'midDescription': midDescription,
        'longDescription': longDescription,
        'sortWeight': sortWeight,
      };
}
