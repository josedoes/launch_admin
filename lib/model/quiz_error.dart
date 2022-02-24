// To parse this JSON data, do
//
//     final quizError = quizErrorFromJson(jsonString);

import 'dart:convert';

QuizError quizErrorFromJson(String str) => QuizError.fromJson(json.decode(str));

String quizErrorToJson(QuizError data) => json.encode(data.toJson());

class QuizError {
  QuizError({
    required this.answer,
    required this.explanation,
    required this.hintChunks,
  });

  final Answer answer;
  final String explanation;
  final List<TextChunk> hintChunks;

  QuizError copyWith({
    Answer? answer,
    String? explanation,
    List<TextChunk>? hintChunks,
  }) =>
      QuizError(
        answer: answer ?? this.answer,
        explanation: explanation ?? this.explanation,
        hintChunks: hintChunks ?? this.hintChunks,
      );

  factory QuizError.fromJson(Map<String, dynamic> json) => QuizError(
        answer: Answer.fromJson(json["answer"]),
        explanation: json["explanation"],
        hintChunks: List<TextChunk>.from(
            json["hintChunks"].map((x) => TextChunk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "answer": answer.toJson(),
        "explanation": explanation,
        "hintChunks": List<dynamic>.from(hintChunks.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.type,
    required this.content,
  });

  final String type;
  final String content;

  Answer copyWith({
    String? type,
    String? content,
  }) =>
      Answer(
        type: type ?? this.type,
        content: content ?? this.content,
      );

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        type: json["type"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "content": content,
      };
}

class TextChunk {
  TextChunk({
    required this.content,
    required this.link,
  });

  final String content;
  final Link link;

  TextChunk copyWith({
    String? content,
    Link? link,
  }) =>
      TextChunk(
        content: content ?? this.content,
        link: link ?? this.link,
      );

  factory TextChunk.fromJson(Map<String, dynamic> json) => TextChunk(
        content: json["content"],
        link: Link.fromJson(json["link"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link.toJson(),
      };
}

class Link {
  Link({
    required this.link,
    required this.type,
  });

  final String link;
  final String type;

  Link copyWith({
    String? link,
    String? type,
  }) =>
      Link(
        link: link ?? this.link,
        type: type ?? this.type,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        link: json["link"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "type": type,
      };
}
