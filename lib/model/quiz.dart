// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    required this.id,
    required this.lessonId,
    required this.version,
    required this.name,
    required this.linkToSolution,
    required this.correctAnswerIndex,
    required this.instruction,
    required this.clue,
    required this.possibleAnswers,
    required this.error,
    required this.v,
  });

  final String id;
  final String lessonId;
  final double version;
  final String name;
  final String? linkToSolution;
  final int correctAnswerIndex;
  final String instruction;
  final Answer clue;
  final List<Answer> possibleAnswers;
  final QuizError error;
  final int v;

  Quiz copyWith({
    String? id,
    String? lessonId,
    double? version,
    String? name,
    String? linkToSolution,
    int? correctAnswerIndex,
    String? instruction,
    Answer? clue,
    List<Answer>? possibleAnswers,
    QuizError? error,
    int? v,
  }) =>
      Quiz(
        id: id ?? this.id,
        lessonId: lessonId ?? this.lessonId,
        version: version ?? this.version,
        name: name ?? this.name,
        linkToSolution: linkToSolution ?? this.linkToSolution,
        correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
        instruction: instruction ?? this.instruction,
        clue: clue ?? this.clue,
        possibleAnswers: possibleAnswers ?? this.possibleAnswers,
        error: error ?? this.error,
        v: v ?? this.v,
      );

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["_id"],
        lessonId: json["lessonId"],
        version: json["version"].toDouble(),
        name: json["name"],
        linkToSolution: json["linkToSolution"],
        correctAnswerIndex: json["correctAnswerIndex"],
        instruction: json["instruction"]??'',
        clue: Answer.fromJson(json["clue"]),
        possibleAnswers: List<Answer>.from(
            json["possibleAnswers"].map((x) => Answer.fromJson(x))),
        error: QuizError.fromJson(json["error"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "lessonId": lessonId,
        "version": version,
        "name": name,
        "linkToSolution": linkToSolution,
        "correctAnswerIndex": correctAnswerIndex,
        "instruction": instruction,
        "clue": clue.toJson(),
        "possibleAnswers":
            List<dynamic>.from(possibleAnswers.map((x) => x.toJson())),
        "error": error.toJson(),
        "__v": v,
      };
}

class Answer extends Equatable {
  const Answer({
    required this.type,
    required this.content,
    required this.id,
  });

  final String type;
  final String content;
  final String id;

  Answer copyWith({
    String? type,
    String? content,
    String? id,
  }) =>
      Answer(
        type: type ?? this.type,
        content: content ?? this.content,
        id: id ?? this.id,
      );

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        type: json["type"],
        content: json["content"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "content": content,
        "_id": id,
      };

  @override
  List<Object?> get props => [type, content, id];
}

class QuizError {
  QuizError({
    required this.answer,
    required this.explanation,
    required this.hintChunks,
    required this.id,
  });

  final Answer answer;
  final String explanation;
  final List<HintChunk> hintChunks;
  final String id;

  QuizError copyWith({
    Answer? answer,
    String? explanation,
    List<HintChunk>? hintChunks,
    String? id,
  }) =>
      QuizError(
        answer: answer ?? this.answer,
        explanation: explanation ?? this.explanation,
        hintChunks: hintChunks ?? this.hintChunks,
        id: id ?? this.id,
      );

  factory QuizError.fromJson(Map<String, dynamic> json) => QuizError(
        answer: Answer.fromJson(json["answer"]),
        explanation: json["explanation"],
        hintChunks: List<HintChunk>.from(
            json["hintChunks"].map((x) => HintChunk.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer.toJson(),
        "explanation": explanation,
        "hintChunks": List<dynamic>.from(hintChunks.map((x) => x.toJson())),
        "_id": id,
      };
}

class HintChunk {
  HintChunk({
    required this.content,
    required this.link,
    required this.id,
  });

  final String? content;
  final Link link;
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
        content: json["content"],
        link: Link.fromJson(json["link"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link.toJson(),
        "_id": id,
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
        link: json["link"],
        type: json["type"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "type": type,
        "_id": id,
      };
}
