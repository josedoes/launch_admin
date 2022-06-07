import 'package:code_learn/model/multiple_choice.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('quiz can parse dart map', () {
      expect(
        true,
        MultipleChoice.fromJson(map).id == map['_id'],
        reason: 'parses id correctly',
      );
    }
  );
}

final map = {
  "_id": "622939c4b2b0a6cf815ff202",
  "lessonId": "62293994b2b0a6cf815ff1fb",
  "version": 0,
  "name": "Test your knoledge 1",
  "linkToSolution": "linkToSolution",
  "error": {
    "answer": {
      "type": "paragraph",
      "content": "ntry of app",
      "_id": "622939c4b2b0a6cf815ff204"
    },
    "explanation": "explanation",
    "hintChunks": [
      {
        "content": "content",
        "link": {
          "link": "link",
          "type": "type",
          "_id": "622939c4b2b0a6cf815ff206"
        },
        "_id": "622939c4b2b0a6cf815ff205"
      }
    ],
    "_id": "622939c4b2b0a6cf815ff203"
  },
  "correctAnswerIndex": 0,
  "instruction": "instruction",
  "clue": {
    "type": "paragraph",
    "content": "what is main for",
    "_id": "622939c4b2b0a6cf815ff207"
  },
  "possibleAnswers": [
    {
      "type": "paragraph",
      "content": "entry of app",
      "_id": "622939c4b2b0a6cf815ff208"
    }
  ],
  "__v": 0
};
