import 'dart:convert';

Lesson courseFromJson(String str) => Lesson.fromJson(json.decode(str));

String courseToJson(Lesson data) => json.encode(data.toJson());

class Lesson {
  Lesson({
    required this.moduleId,
    required this.versionId,
    required this.page,
    required this.id,
    this.isBeginner = true,
    this.sortWeight = 0,
  });

  final String moduleId;
  final double versionId;
  final Page page;
  final double sortWeight;
  final String id;
  final bool isBeginner;

  Lesson copyWith({
    String? moduleId,
    double? versionId,
    Page? page,
    String? id,
    bool? isBeginner,
    double? sortWeight,
  }) =>
      Lesson(
          moduleId: moduleId ?? this.moduleId,
          versionId: versionId ?? this.versionId,
          page: page ?? this.page,
          id: id ?? this.id,
          sortWeight: sortWeight ?? this.sortWeight,
          isBeginner: isBeginner ?? this.isBeginner);

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        moduleId: json["moduleId"],
        versionId: json["versionId"] ?? 0,
        page: Page.fromJson(json["page"]),
        id: json["_id"],
        sortWeight: json['sortWeight'] ?? 0,
        isBeginner: json['isBeginner'] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "moduleId": moduleId,
        "versionId": versionId,
        "page": page.toJson(),
        'sortWeight': sortWeight,
        "_id": id,
        'isBeginner': isBeginner,
      };

  @override
  String toString() {
    return 'Lesson{moduleId: $moduleId, versionId: $versionId, page: $page, sortWeight: $sortWeight, id: $id, isBeginner: $isBeginner}';
  }
}

class Page {
  Page({
    required this.title,
    required this.subTitle,
    required this.content,
    required this.id,
  });

  final String title;
  final String subTitle;
  final List<Content> content;
  final String id;

  Page copyWith({
    String? title,
    String? subTitle,
    List<Content>? content,
    String? id,
  }) =>
      Page(
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        content: content ?? this.content,
        id: id ?? this.id,
      );

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        title: json["title"],
        subTitle: json["subTitle"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "_id": id,
      };
}

class Content {
  const Content({
    required this.type,
    required this.content,
    required this.support,
    required this.id,
  });

  final String type;
  final String content;
  final dynamic support;
  final String id;

  static const paragraph = 'paragraph';
  static const image = 'image';
  static const code = 'code';
  static const dartPad = 'dartPad';

  static const list = [paragraph, image, code, dartPad];

  Content copyWith({
    String? type,
    String? content,
    String? support,
    String? id,
  }) =>
      Content(
        type: type ?? this.type,
        content: content ?? this.content,
        support: support ?? this.support,
        id: id ?? this.id,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["type"],
        content: json["content"],
        support: json["support"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "content": content,
        "support": support,
        "_id": id,
      };
}
