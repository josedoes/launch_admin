import 'package:code_learn/model/work.dart';

class FillInTheBlanks extends RocketWork {
  FillInTheBlanks({
    required this.id,
    required this.type,
    required this.lessonId,
    required this.version,
    required this.successMessage,
    required this.instruction,
    required this.clue,
    required this.codeBlanksElements,
    required this.possibleBlankFillers,
    required this.v,
  });

  final String id;
  final String type;
  final String lessonId;
  final double version;
  final SuccessMessage successMessage;
  final String instruction;
  final Clue clue;
  final List<CodeBlanksElement> codeBlanksElements;
  final List<PossibleBlankFiller> possibleBlankFillers;
  final int v;

  FillInTheBlanks copyWith({
    String? id,
    String? type,
    String? lessonId,
    double? version,
    SuccessMessage? successMessage,
    String? instruction,
    Clue? clue,
    List<CodeBlanksElement>? codeBlanksElements,
    List<PossibleBlankFiller>? possibleBlankFillers,
    int? v,
  }) =>
      FillInTheBlanks(
        id: id ?? this.id,
        type: type ?? this.type,
        lessonId: lessonId ?? this.lessonId,
        version: version ?? this.version,
        successMessage: successMessage ?? this.successMessage,
        instruction: instruction ?? this.instruction,
        clue: clue ?? this.clue,
        codeBlanksElements: codeBlanksElements ?? this.codeBlanksElements,
        possibleBlankFillers: possibleBlankFillers ?? this.possibleBlankFillers,
        v: v ?? this.v,
      );

  factory FillInTheBlanks.fromJson(Map<String, dynamic> json) =>
      FillInTheBlanks(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        lessonId: json["lessonId"] == null ? null : json["lessonId"],
        version: json["version"] == null ? null : json["version"].toDouble(),
        successMessage: SuccessMessage.fromJson(json["success_message"]),
        instruction: json["instruction"] == null ? null : json["instruction"],
        clue: Clue.fromJson(json["clue"]),
        codeBlanksElements: List<CodeBlanksElement>.from(
            json["codeBlanksElements"]
                .map((a) => CodeBlanksElement.fromJson(a))),
        possibleBlankFillers: List<PossibleBlankFiller>.from(
            json["possibleBlankFillers"]
                .map((a) => PossibleBlankFiller.fromJson(a))),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "type": type == null ? null : type,
        "lessonId": lessonId == null ? null : lessonId,
        "version": version == null ? null : version,
        "success_message":
            successMessage == null ? null : successMessage.toJson(),
        "instruction": instruction == null ? null : instruction,
        "clue": clue == null ? null : clue.toJson(),
        "codeBlanksElements": codeBlanksElements == null
            ? null
            : List<dynamic>.from(codeBlanksElements.map((x) => x.toJson())),
        "possibleBlankFillers": possibleBlankFillers == null
            ? null
            : List<dynamic>.from(possibleBlankFillers.map((x) => x.toJson())),
        "__v": v == null ? null : v,
      };
}

class Clue {
  Clue({
    required this.type,
    required this.content,
    required this.id,
  });

  final String type;
  final String content;
  final String id;

  Clue copyWith({
    String? type,
    String? content,
    String? id,
  }) =>
      Clue(
        type: type ?? this.type,
        content: content ?? this.content,
        id: id ?? this.id,
      );

  factory Clue.fromJson(Map<String, dynamic> json) => Clue(
        type: json["type"] == null ? null : json["type"],
        content: json["content"] == null ? null : json["content"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "content": content == null ? null : content,
        "_id": id == null ? null : id,
      };
}

///[type] can be  be either 'text' or 'blank';
class CodeBlanksElement {
  CodeBlanksElement({
    required this.type,
    this.color,
    this.content,
    required this.index,
    this.correctAnswer,
    required this.id,
  });

  ///[type] can be  be either 'text' or 'blank';
  final String type;
  final String? color;
  final String? content;
  final int index;
  final String? correctAnswer;
  final String id;

  CodeBlanksElement copyWith({
    String? type,
    String? color,
    String? content,
    int? index,
    String? correctAnswer,
    String? id,
  }) =>
      CodeBlanksElement(
        type: type ?? this.type,
        color: color ?? this.color,
        content: content ?? this.content,
        index: index ?? this.index,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        id: id ?? this.id,
      );

  factory CodeBlanksElement.fromJson(Map<String, dynamic> json) =>
      CodeBlanksElement(
        type: json["type"] == null ? null : json["type"],
        color: json["color"] == null ? null : json["color"],
        content: json["content"] == null ? null : json["content"],
        index: json["index"] == null ? null : json["index"],
        correctAnswer:
            json["correctAnswer"] == null ? null : json["correctAnswer"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "color": color == null ? null : color,
        "content": content == null ? null : content,
        "index": index == null ? null : index,
        "correctAnswer": correctAnswer == null ? null : correctAnswer,
        "_id": id == null ? null : id,
      };

  bool isText() => type == 'text';
}

class PossibleBlankFiller {
  PossibleBlankFiller({
    required this.element,
    required this.id,
  });

  final String element;
  final String id;

  PossibleBlankFiller copyWith({
    String? element,
    String? id,
  }) =>
      PossibleBlankFiller(
        element: element ?? this.element,
        id: id ?? this.id,
      );

  factory PossibleBlankFiller.fromJson(Map<String, dynamic> json) =>
      PossibleBlankFiller(
        element: json["element"] == null ? null : json["element"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "element": element == null ? null : element,
        "_id": id == null ? null : id,
      };
}

class SuccessMessage {
  SuccessMessage({
    required this.explanation,
    required this.hintChunks,
    required this.id,
  });

  final String explanation;
  final List<HintChunk> hintChunks;
  final String id;

  SuccessMessage copyWith({
    String? explanation,
    List<HintChunk>? hintChunks,
    String? id,
  }) =>
      SuccessMessage(
        explanation: explanation ?? this.explanation,
        hintChunks: hintChunks ?? this.hintChunks,
        id: id ?? this.id,
      );

  factory SuccessMessage.fromJson(Map<String, dynamic> json) => SuccessMessage(
        explanation: json["explanation"] == null ? null : json["explanation"],
        hintChunks: json["hintChunks"] == null
            ? []
            : List<HintChunk>.from(
                json["hintChunks"].map((x) => HintChunk.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "explanation": explanation == null ? null : explanation,
        "hintChunks": hintChunks == null
            ? null
            : List<dynamic>.from(hintChunks.map((x) => x.toJson())),
        "_id": id == null ? null : id,
      };
}

class HintChunk {
  HintChunk({
    required this.content,
    required this.link,
    required this.id,
  });

  final String content;
  final Link? link;
  final String id;

  HintChunk copyWith({
    String? content,
    Link? link,
    String? id,
  }) =>
      HintChunk(
        content: content ?? this.content,
        link: link ?? this.link,
        id: id ?? this.id,
      );

  factory HintChunk.fromJson(Map<String, dynamic> json) => HintChunk(
        content: json["content"] == null ? null : json["content"],
        link: json["link"] == null ? null : Link.fromJson(json["link"]),
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content,
        "link": link == null ? null : link?.toJson(),
        "_id": id == null ? null : id,
      };
}

class Link {
  Link({
    required this.link,
    required this.type,
    required this.id,
  });

  final String link;
  final String type;
  final String id;

  Link copyWith({
    String? link,
    String? type,
    String? id,
  }) =>
      Link(
        link: link ?? this.link,
        type: type ?? this.type,
        id: id ?? this.id,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        link: json["link"] == null ? null : json["link"],
        type: json["type"] == null ? null : json["type"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? null : link,
        "type": type == null ? null : type,
        "_id": id == null ? null : id,
      };
}
