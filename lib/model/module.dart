// To parse this JSON data, do
//
//     final module = moduleFromJson(jsonString);

import 'dart:convert';

Module moduleFromJson(String str) => Module.fromJson(json.decode(str));

String moduleToJson(Module data) => json.encode(data.toJson());

class Module {
  Module({
    required this.title,
    required this.description,
    required this.lessons,
  });

  final String title;
  final String description;
  final List<String> lessons;

  Module copyWith({
    String? title,
    String? description,
    List<String>? lessons,
  }) =>
      Module(
        title: title ?? this.title,
        description: description ?? this.description,
        lessons: lessons ?? this.lessons,
      );

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        title: json["title"],
        description: json["description"],
        lessons: List<String>.from(json["lessons"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "lessons": List<dynamic>.from(lessons.map((x) => x)),
      };
}
